# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Bastien "neitsab" Traverse <firstname [at] lastname [dot] email>
# Contributor: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=ghostwriter
pkgver=1.7.4
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
source=("https://github.com/wereturtle/ghostwriter/archive/v${pkgver}.tar.gz")
sha512sums=('b09e0f8152cd8bdd4465f20d94134ea6ef840b4ccd6d9f75bce8452917d98adc89093c661ecde0400fba7d68f832633c8fe0b19a1607ce79e3f400caa573da8f')

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
