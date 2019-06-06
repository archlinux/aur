# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=dislocker
pkgver=0.7.1
pkgrel=3
pkgdesc="Read/write BitLocker-encrypted volumes"
arch=('i686' 'x86_64')
url="https://github.com/Aorimn/dislocker"
license=('GPL2')
depends=('fuse' 'mbedtls' 'ruby')
makedepends=('make' 'cmake')
conflicts=('dislocker-git')
optdepends=('ntfs-3g: NTFS file system support')
source=($url/archive/v$pkgver.tar.gz)
sha1sums=('0c5c62f63ba587663eb0474f1bd6ca7e345fe977')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -Dlibdir=/usr/lib \
        -D WARN_FLAGS:STRING="-Wall -Wextra" \
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
