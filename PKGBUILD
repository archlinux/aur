# Maintainer: Benoit Pierre <benoit.pierre@gmail.com>

pkgname=packpack
pkgver=1.0
pkgrel=1
pkgdesc='Simple building of RPMs & Debian packages from git repos'
arch=('any')
license=('BSD')
url='https://github.com/packpack/packpack'
makedepends=()
depends=(coreutils bash docker)
source=(https://github.com/packpack/packpack/archive/$pkgver/packpack-$pkgver.tar.gz)
sha1sums=('d2f1f410e6dbe414d0f1964bcfb662123a974b03')

prepare() {
  cd "$pkgname-$pkgver"
  echo -n "$pkgver" >VERSION
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
