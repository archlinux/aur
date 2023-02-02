# Maintainer: Mohammad Abdolirad <m.abdolirad@gmail.com>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=wait4x
pkgver=2.12.0
pkgrel=1
pkgdesc="Wait4X allows you to wait for a port or a service to enter the requested state"
arch=('x86_64' 'x86' 'aarch64' 'armhf' 'ppc64le' 's390x' 'armv7')
url="https://wait4x.dev"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("wait4x-${pkgver}.tar.gz::https://github.com/atkrad/wait4x/archive/v${pkgver}.tar.gz")
sha256sums=('13140941afd2917dd1baa2ab1b94ca7c6740013031319dab2660e8dbe47bc15f')

build() {
	cd "wait4x-$pkgver"

	WAIT4X_BUILD_OUTPUT=./ WAIT4X_COMMIT_REF_SLUG="v$pkgver" make build

	./wait4x version
	./wait4x completion bash > wait4x.bash
	./wait4x completion zsh > wait4x.zsh
	./wait4x completion fish > wait4x.fish
}

package() {
	cd "wait4x-$pkgver"

	install -Dm 755 "wait4x" -t "$pkgdir/usr/bin"

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/wait4x/LICENSE"

	install -Dm644 wait4x.bash "$pkgdir/usr/share/bash-completion/completions/wait4x"
	install -Dm644 wait4x.zsh "$pkgdir/usr/share/zsh/site-functions/_wait4x"
	install -Dm644 wait4x.fish "$pkgdir/usr/share/fish/vendor_completions.d/wait4x.fish"
}
