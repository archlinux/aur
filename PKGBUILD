# Maintainer: kedap <dxhqezk@hi2.in>

pkgname=apmpkg
pkgver=1.0.2
pkgrel=1
pkgdesc="Un administrador de paquetes universal para linux como modelo: PKGBUILD"
arch=('x86_64')
url="https://github.com/Kedap/apmpkg"
license=('Apache')
depends=('git' 'python-pip' 'python2-pip' 'curl' 'fakeroot' 'ruby-bundler' 'rsync')
makedepends=('cargo')
conflicts=('apmpkg-git')
source=("https://codeload.github.com/Kedap/${pkgname}/tar.gz/refs/tags/${pkgver}")
sha256sums=('35ce64a6d6562d3fcae3b32c0232a1fcb028f2aef5854c1261284de9e6534f2a')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
	mkdir -p ${pkgdir}/etc/apmpkg/iiabc
	cp -r src/iiabc/ ${pkgdir}/etc/apmpkg/
	mkdir -p ${pkgdir}/etc/apmpkg/paquetes
  install -Dm 644 "${pkgname}.1" -t ${pkgdir}/usr/share/man/man1
}
