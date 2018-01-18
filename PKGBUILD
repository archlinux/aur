# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=ttf-b612-git
_pkgname=ttf-b612
pkgver=1.003r3.bd14fde
pkgrel=1
pkgdesc="An highly legible open source font family designed and tested to be used on aircraft cockpit screens"
arch=("any")
url="http://b612-font.com/"
license=("EPL")
depends=(fontconfig xorg-font-utils )
makedepends=("git")
source=("git://git.polarsys.org/gitroot/b612/b612.git")
md5sums=("SKIP")
provides=("ttf-b612" "ttf-b612-mono")
conflicts=("ttf-b612" "ttf-b612-mono")

pkgver() {
  cd $srcdir/b612
  printf "1.003r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/b612
  install -d -m755 "$pkgdir/usr/share/licenses/$_pkgname"
  install -D -m644 edl-v10.html "$pkgdir/usr/share/licenses/$_pkgname/edl-v10.html"
  install -D -m644 epl-v10.html "$pkgdir/usr/share/licenses/$_pkgname/epl-v10.html"

  install -d -m755 "$pkgdir/usr/share/fonts/TTF"
  cd TTF
  mv "B612 Mono-BoldItalic.ttf" "B612-Mono-BoldItalic.ttf"
  mv "B612 Mono-Bold.ttf" "B612-Mono-Bold.ttf"
  mv "B612 Mono-Italic.ttf" "B612-Mono-Italic.ttf"
  mv "B612 Mono-Regular.ttf" "B612-Mono-Regular.ttf"
  find . -name "*.ttf" -exec install -D -m644 "{}" "$pkgdir/usr/share/fonts/TTF/{}" \;
}
