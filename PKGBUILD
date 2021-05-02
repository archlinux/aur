# Maintainer: kedap <dxhqezk@hi2.in>

pkgname=apmpkg
pkgver=1.0
pkgrel=1
pkgdesc="Un administrador de paquetes universal para linux como modelo: PKGBUILD"
arch=('x86_64')
url="https://github.com/Kedap/apmpkg"
license=('Apache')
depends=('git' 'python-pip' 'python2-pip' 'curl' 'fakeroot' 'ruby-bundler')
makedepends=('cargo')
conflicts=('apmpkg-git')
source=("https://codeload.github.com/Kedap/${pkgname}/tar.gz/refs/tags/${pkgver}")
sha256sums=('e22c41f62aedd5e231dfd995d743545bbaf4c3b7cf08ffa92f0734a088126ecf')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

check() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
	mkdir -p ${pkgdir}/etc/apmpkg/iiabc
	cp -r src/iiabc/ ${pkgdir}/etc/apmpkg/
	mkdir -p ${pkgdir}/etc/apmpkg/paquetes
  install -Dm 644 "${pkgname}.1" -t ${pkgdir}/usr/share/man/man1
}
