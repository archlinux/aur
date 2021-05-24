# Maintainer: kedap <dxhqezk@hi2.in>

pkgname=apmpkg
pkgver=1.1.1
pkgrel=1
pkgdesc="Un administrador de paquetes universal para linux como modelo: PKGBUILD"
arch=('x86_64')
url="https://github.com/Kedap/apmpkg"
license=('Apache')
depends=('git' 'python-pip' 'python2-pip' 'wget' 'fakeroot' 'ruby-bundler' 'rsync')
makedepends=('cargo')
conflicts=('apmpkg-git-dev')
source=("https://github.com/Kedap/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ae689376d172ac1bed329f6392ddc286bcf9fb34d42824ee42c136878fea976f')

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
