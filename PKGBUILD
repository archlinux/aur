# Original contributor: Karro <karolina.lindqvist@kramnet.se>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libcd
pkgver=5.11
pkgrel=2
pkgdesc="Platform-independent graphics library"
arch=('i686' 'x86_64')
url="http://www.tecgraf.puc-rio.br/cd/"
depends=('ftgl' 'gtk3' 'libxmu')
makedepends=('lua')
license=('custom')
options=('staticlibs')

source=(
  "http://downloads.sourceforge.net/project/canvasdraw/${pkgver}/Docs%20and%20Sources/cd-${pkgver}_Sources.tar.gz"
  "http://downloads.sourceforge.net/project/canvasdraw/${pkgver}/Docs%20and%20Sources/cd-${pkgver}_Docs.pdf"
  LICENSE
  cdpdf.mak.patch
  cdluaim5.patch
)
md5sums=('fe722e1217412135b1be7752ee59958f'
         'b5869667080daba6ecfdd5ba0f54f8bb'
         '3b326faf9f9ab35096453525b55bd8c8'
         'eec4463334ef927ed6c4ccb81086c6df'
         'ed8a4b981b24f38d82efd8aa5b3dea87')

build() {
  cd "$srcdir"/cd
  make || true
}

package() {
  cd "$srcdir"/cd
  install -m755 -d "$pkgdir"/usr/lib
  install -m644 lib/L*/*.{a,so} "$pkgdir"/usr/lib
  install -m755 -d "$pkgdir"/usr/share/$pkgname
  install -m644 "$srcdir"/cd-${pkgver}_Docs.pdf "$pkgdir"/usr/share/$pkgname
  install -m755 -d "$pkgdir"/usr/include/cd
  install -m644 "$srcdir"/cd/include/* "$pkgdir"/usr/include/cd
  install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -d "$pkgdir"/usr/lua/5.1/
  install -Dm644 "$srcdir"/cd/lib/Linux48_64/Lua51/*.so "$pkgdir"/usr/lua/5.1/
}
