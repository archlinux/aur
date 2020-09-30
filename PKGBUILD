pkgname=jape
pkgver=9.0.9
_pkgfile=${pkgver//./_}
pkgrel=1
pkgdesc='A configurable, graphical proof assistant.'
arch=('x86_64')
url='http://japeforall.org.uk/'
license=('GPL')
depends=('java-runtime>=9')
makedepends=('unzip')
source=('jape'
        'jape.desktop')
sha256sums=('43cfa222c48f819c9c4508f4847212d4327f8c7aa49ba4f3bfc9dc4f0f330f8d'
            '4677512343900e325f763cf79c8571ae3e493d7f074ebc7c68182ef487e6e579')
source_x86_64=("https://github.com/RBornat/jape/releases/download/$pkgver/${_pkgfile}_InstallLinuxjape.jar")
noextract=("${_pkgfile}_InstallLinuxjape.jar")
sha256sums_x86_64=('dc001d7fde1e8808e474393e5a987f6c731b0915118a50e4c6750ccec534b00b')

package() {
  cd "$srcdir"

  unzip "${_pkgfile}_InstallLinuxjape.jar" || true  # Invalid JAR file

  install -d "$pkgdir/usr/share/jape"
  install -m755 jape_engine "$pkgdir/usr/share/jape/"
  install -m644 README-LINUX README_encoder.txt "$pkgdir/usr/share/jape/"
  cp -dpr --no-preserve=ownership examples "$pkgdir/usr/share/jape/"

  install -d "$pkgdir/usr/share/java/jape"
  install -m644 Jape.jar encoder.jar "$pkgdir/usr/share/java/jape/"

  install -Dm755 jape "$pkgdir/usr/bin/jape"
  install -Dm644 jape.desktop "$pkgdir/usr/share/applications/jape.desktop"
}
