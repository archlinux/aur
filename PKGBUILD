# Maintainer: Mattias Giese <mattiasgiese@posteo.net>
pkgname=kanshi-git
pkgver=r45.970267e
pkgrel=1
pkgdesc="Dynamic display configuration for WMs like i3/sway"
arch=(x86_64)
url="https://github.com/emersion/kanshi"
license=('MIT')
groups=()
depends=('rust')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('kanshi::git+https://github.com/emersion/kanshi.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/${pkgname%-git}"
  cargo build --release --locked
}

check() {
	cd "$srcdir/${pkgname%-git}"
  cargo test --release --locked ${pkgname%-git}
}

package() {
	cd "$srcdir/${pkgname%-git}"
  install -Dm 755 target/release/${pkgname%-git} -t "${pkgdir}/usr/bin"
}
