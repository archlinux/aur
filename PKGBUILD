# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>

pkgname=gshisen.app
pkgrel=2
pkgver=1.3.0
pkgdesc='Shisen-sho puzzle game for GNUstep'
arch=('i686' 'x86_64')
url='http://www.nongnu.org/gap/gshisen/index.html'
license=('GPL')
groups=('gnustep')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc')
source=("https://savannah.nongnu.org/download/gap/GShisen-$pkgver.tar.gz")
sha256sums=('f904621f70cccc2efa70698c21a78049870fb4305775f9a04ecf7f7a7f4a5dfe')

build() {
  cd GShisen-$pkgver
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd GShisen-$pkgver
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir"/usr/share/applications
  ln -s /usr/lib/GNUstep/Applications/GShisen.app/Resources/GShisen.desktop \
    "$pkgdir"/usr/share/applications/GShisen.desktop
}
