# Contributor: <mumei AT airmail DOT cc>

_pkgname=FisicaLab
pkgname=fisicalab.app
pkgrel=1
pkgver=0.4.0
pkgdesc='Become familiar with physical concepts without the risk of getting lost in mathematical details'
arch=('i686' 'x86_64' 'armv7h')
url='https://www.gnu.org/software/fisicalab'
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back' 'gsl')
makedepends=('gcc-objc' 'gnustep-make' 'renaissance')
source=("https://ftp.gnu.org/gnu/fisicalab/fisicalab-0.4.0.tar.gz")
sha256sums=('e08bf78ee55d3477754b3a3eb9c36a3f66a28da81005cf323df2b82950328c82')

build() {
#  cd "fisicalab-$pkgver"
  cd trunk
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  ./configure
  make
# Fix Icon Path
  sed -i 's/tiff/tif/;s/í/i/g' FisicaLab.app/Resources/FisicaLab.desktop 
}

package() {
#  cd "fisicalab-$pkgver"
  cd trunk
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
