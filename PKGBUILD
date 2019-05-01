# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Bastien "neitsab" Traverse <firstname [at] lastname [dot] email>
# Contributor: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=ghostwriter
pkgver=1.8.0
pkgrel=1
pkgdesc="A cross-platform, aesthetic, distraction-free Markdown editor"
arch=('i686' 'x86_64')
url="https://github.com/wereturtle/ghostwriter"
license=('GPL3')
depends=('qt5-svg' 'qt5-webengine' 'hunspell' 'desktop-file-utils')
makedepends=('qt5-tools')
optdepends=('multimarkdown: For alternative converter, superset of Markdown with various output formats'
            'pandoc: For Pandoc supported Markdown flavors and export to various formats'
            'cmark: For processing and rendering CommonMark')
source=("https://github.com/wereturtle/ghostwriter/archive/v${pkgver}.tar.gz")
sha512sums=('aff500d9221f28f6a06a93bf0b5ddb590792b22bc551749b790f52751cd7f2e27ea59778927c2f117320cb1791b45d51d8efdf479f0894319755afb1a509f7bd')

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
