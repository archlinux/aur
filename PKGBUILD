# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Bastien "neitsab" Traverse <firstname [at] lastname [dot] email>
# Contributor: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=ghostwriter
pkgver=1.7.1
pkgrel=1
pkgdesc="A cross-platform, aesthetic, distraction-free Markdown editor"
arch=('i686' 'x86_64')
url="https://github.com/wereturtle/ghostwriter"
license=('GPL3')
depends=('qt5-svg' 'qt5-webkit' 'hunspell' 'hicolor-icon-theme')
makedepends=('qt5-tools')
optdepends=('multimarkdown: For alternative converter, superset of Markdown with various output formats'
            'pandoc: For Pandoc supported Markdown flavors and export to various formats'
            'cmark: For processing and rendering CommonMark')
source=("https://github.com/wereturtle/ghostwriter/archive/v${pkgver}.tar.gz"
        "https://github.com/wereturtle/ghostwriter/compare/v1.7.1...c2d24150aec2890c42a0f5274a1bf941ee997175.patch")
md5sums=('34122f91be26462048b6afb54cebef41'
         'a940d931e1b44afe4c6e07eb136d9021')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 < "${srcdir}/v1.7.1...c2d24150aec2890c42a0f5274a1bf941ee997175.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  qmake PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install INSTALL_ROOT="${pkgdir}"

  install -Dm644 "CREDITS.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/CREDITS.md"
  install -Dm644 "README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "resources/COPYING" \
    "${pkgdir}/usr/share/doc/${pkgname}/COPYING"
}
