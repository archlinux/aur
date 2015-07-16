# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Frank Ickstadt (frank dot ickstadt at gmail dot com)
# adpoted from mOLOk since pkgver=0.7

pkgname=xcalib
pkgver=0.8
pkgrel=7
pkgdesc="A tiny monitor calibration loader for X.org"
arch=('i686' 'x86_64')
url="http://xcalib.sourceforge.net/"
license=('GPL')
depends=('libxxf86vm')
source=("http://downloads.sourceforge.net/xcalib/xcalib-source-$pkgver.tar.gz"
        "makefile-ldflags.patch")
sha256sums=('8a112ee710e5446f6c36e62345b2066f10639d500259db8c48bf1716caea06e6'
            '09b50960bff9848fbae0045f61a8bf081366f6658477584126f13534a23d596e')

build() {
  cd "$pkgname-$pkgver"
  patch -p0 < ../makefile-ldflags.patch
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir"/usr/{share/xcalib,bin}
  install -m755 xcalib "$pkgdir"/usr/bin
  install -m644 README *.icc *.icm "$pkgdir"/usr/share/xcalib/
}
