# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=dislocker
pkgver=0.6.1
pkgrel=1
pkgdesc="Read BitLocker encrypted volumes under Linux"
arch=('i686' 'x86_64')
url="http://www.hsc.fr/ressources/outils/dislocker"
license=('GPL2')
depends=('fuse' 'mbedtls' 'ruby')
makedepends=('make' 'cmake')
conflicts=('dislocker-git')
optdepends=('ntfs-3g: NTFS file system support')
source=(https://github.com/Aorimn/dislocker/archive/v$pkgver.tar.gz)
sha1sums=('6e7ad789ec277eb4484742686cac1f69547abec5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -Dlibdir=/usr/lib \
        .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
