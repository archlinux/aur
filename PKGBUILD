# Maintainer: Dmytro Kostiuchenko <edio@archlinux.us>
pkgname=gimp2.10-plugin-lqr
pkgver=0.7.2
pkgrel=1
pkgdesc="Plugin for The GIMP providing Liquid Rescale. Temporary fix for GIMP 2.10"
arch=('x86_64')
url="https://liquidrescale.wikidot.com/"
license=('GPL')
provides=('gimp-plugin-lqr')
conflicts=('gimp-plugin-lqr')
depends=('gimp' 'liblqr')
makedepends=('intltool' 'patch')
source=(
    https://liquidrescale.wikidot.com/local--files/en:download-page-sources/gimp-lqr-plugin-$pkgver.tar.bz2
    patch.diff
)

md5sums=('af7eb1a0d480bacfa6e5eff9b06bd877'
         'c9350c285674d3aebac286d1a13fdda9')

build() {
  cd "$srcdir"/gimp-lqr-plugin-$pkgver
  patch -p1 -i ../patch.diff
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/gimp-lqr-plugin-$pkgver
  make DESTDIR="$pkgdir" install
}

