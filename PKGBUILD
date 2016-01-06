# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=dislocker
pkgver=0.5.1
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
sha1sums=('dd8903ae751a3093e0ef74e31cd98ad21d08f2ae')

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

  ln -s /usr/bin/dislocker-fuse ${pkgdir}/usr/bin/dislocker
  ln -s /usr/share/man/man1/dislocker-fuse.1.gz ${pkgdir}/usr/share/man/man1/dislocker.1.gz

  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
