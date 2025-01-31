# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>

pkgname=hodie
pkgver=1.5
pkgrel=1
pkgdesc="Prints the date in Latin."
url="https://github.com/michiexile/hodie"
arch=('i686' 'x86_64')
license=('MIT')
source=(${url}/archive/refs/tags/${pkgname}-${pkgver}.tar.gz)

sha256sums=('c6c3d0b49e2a12d86b675b74bf57d4187a4bb44d99062bb492ab9ae8500a0ebc')

prepare() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  chmod +x autogen.sh
  ./autogen.sh
  gzip hodie.1
}

build() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  make || return 1
}

package() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  make prefix="/usr" DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 hodie.1.gz "${pkgdir}/usr/share/man/man1/hodie.1"
}
