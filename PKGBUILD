# Maintainer: <mumei AT airmail DOT cc>

_pkgname=FisicaLab
pkgname=fisicalab.app
pkgrel=1
pkgver=0.3.5
pkgdesc='Become familiar with physical concepts without the risk of getting lost in mathematical details'
arch=('i686' 'x86_64' 'armv7h')
url='https://www.gnu.org/software/fisicalab'
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back' 'gsl')
makedepends=('gcc-objc' 'gnustep-make')
source=("https://ftp.gnu.org/gnu/fisicalab/fisicalab-0.3.5-1.tar.gz")
sha256sums=('a710d5ac8f5a096cbd2972fc42d8861f7996321161f90132c8e67c4704e55bb9')

build() {
  cd "fisicalab-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  ./configure
  make
# Fix Icon Path
  sed -i 's/tiff/tif/;s/í/i/g' FisicaLab.app/Resources/FisicaLab.desktop 
}

package() {
  cd "fisicalab-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
