# Maintainer: Stefan Gehr <stefan@gehr.xyz>
_name=seniorpw
pkgname="${_name}"-git
pkgver=r317.556aa4c
pkgrel=1
pkgdesc='password manager using age as backend; inspired by pass'
arch=('any')
url='https://gitlab.com/retirement-home/seniorpw'
license=('AGPL3')
depends=(tree)
optdepends=(git wl-clipboard)
makedepends=(cargo git)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$_name"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_name"
	cargo build --bins --locked --release --target-dir target
}

package() {
	cd "$_name"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
	install -Dm755 target/release/senior -t "$pkgdir"/usr/bin/
	install -Dm644 completions/senior.zsh "$pkgdir"/usr/share/zsh/site-functions/_senior
	install -Dm644 completions/senior.bash "$pkgdir"/usr/share/bash-completion/completions/senior
	install -Dm644 man/* -t "$pkgdir"/usr/share/man/man1
}
