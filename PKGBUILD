# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=ttf-b612-git
_pkgname=ttf-b612
pkgver=1.008.r3.g48ac6ba
pkgrel=3
pkgdesc="An highly legible open source font family designed and tested to be used on aircraft cockpit screens"
arch=("any")
url="https://b612-font.com/"
license=("EPL")
depends=(fontconfig)
makedepends=("git")
source=("git+https://github.com/polarsys/b612.git")
md5sums=("SKIP")
provides=("ttf-b612" "ttf-b612-mono")
conflicts=("ttf-b612" "ttf-b612-mono")

pkgver() {
    cd "$srcdir/b612"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/b612"
  install -d -m755 "$pkgdir/usr/share/licenses/$_pkgname"
  install -D -m644 edl-v10.html "$pkgdir/usr/share/licenses/$_pkgname/edl-v10.html"
  install -D -m644 EPL-2.0.html "$pkgdir/usr/share/licenses/$_pkgname/EPL-2.0.html"
  install -D -m644 OFL.txt "$pkgdir/usr/share/licenses/$_pkgname/OFL.txt"

  install -d -m755 "$pkgdir/usr/share/fonts/TTF"
  cd fonts/ttf
  install -D -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
}
