# Maintainer: <mumei AT airmail DOT cc>

pkgname=zipper.app
_pkgname=Zipper
pkgrel=1
pkgver=1.5
pkgdesc="Multi-format archive extractor with compression services"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gap/zipper/index.html"
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
optdepends=('arj'
            'bzip2'
            'gzip'
            'lha'
            'p7zip'
            'rar'
            'tar'
            'unarj'
            'unrar'
            'zoo')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/$_pkgname-$pkgver.tar.gz")
sha256sums=('3ecf9cd7e2242c62e38a4933ce4f3da35e90f52ca94ac030a1f2a717e6561392')

build() {
  cd "$_pkgname-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
