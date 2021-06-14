# Maintainer: Nikolay Bryskin <nbryskin@gmail.com>
pkgname=linux-enable-ir-emitter-git
pkgver=r109.624855b
pkgrel=1
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box."
arch=('x86_64')
url="https://github.com/EmixamPP/linux-enable-ir-emitter"
license=('Unlicense')
depends=('python')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
source=('git+https://github.com/EmixamPP/linux-enable-ir-emitter')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}/package"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/package"
	install -Dm 755 -t $pkgdir/usr/bin/ linux-enable-ir-emitter
	install -Dm 755 -t $pkgdir/usr/lib/linux-enable-ir-emitter/ enable-ir-emitter
	install -Dm 755 -t $pkgdir/usr/lib/linux-enable-ir-emitter/ find-config-ir-emitter.py
	install -Dm 644 -t $pkgdir/usr/lib/linux-enable-ir-emitter/ ../auto/config.yaml
	install -Dm 644 -t $pkgdir/usr/lib/systemd/system/ linux-enable-ir-emitter.service
}
