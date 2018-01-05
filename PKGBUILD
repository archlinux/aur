# Maintainer:
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>

pkgname=jigsaw.app
pkgrel=2
pkgver=0.8
pkgdesc='A puzzle game for GNUstep'
arch=('i686' 'x86_64')
url='http://www.nongnu.org/gap/jigsaw/index.html'
license=('GPL')
groups=('gnustep')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc')
source=("https://savannah.nongnu.org/download/gap/Jigsaw-$pkgver.tar.gz")
sha256sums=('35aaddd5582edb07c302496f9a70bc9c344755c321eebf30feb540d0c993e6c3')

build() {
  cd Jigsaw-$pkgver
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd Jigsaw-$pkgver
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir"/usr/share/applications
  ln -s /usr/lib/GNUstep/Applications/Jigsaw.app/Resources/Jigsaw.desktop \
    "$pkgdir"/usr/share/applications/Jigsaw.desktop
}
