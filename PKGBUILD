# Maintainer: kedap <kqybspvj@hi2.in>

pkgname=apmpkg
pkgver=1.3.0
pkgrel=1
pkgdesc="Un administrador de paquetes universal para linux como modelo: PKGBUILD"
arch=('x86_64')
url="https://github.com/Kedap/apmpkg"
license=('Apache')
optdepends=('flatpak: for install dependencies
  snap: for install dependencies
  npm: for install dependencies')
depends=('git' 'python-pip' 'python2-pip' 'wget' 'fakeroot' 'ruby-bundler' 'rsync')
makedepends=('cargo')
conflicts=('apmpkg-git-dev')
source=("https://github.com/Kedap/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('56a1b7b21642556ace47850034c3af3394e7013174d7f18890eb86ebae239df4')

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
    install -Dm 644 "man/${pkgname}.1" -t ${pkgdir}/usr/share/man/man1
    install -Dm 644 "man/${pkgname}-en.1" -t ${pkgdir}/usr/share/man/man1
}
