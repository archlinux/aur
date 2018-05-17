# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Bastien "neitsab" Traverse <firstname [at] lastname [dot] email>
# Contributor: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=ghostwriter
pkgver=1.6.2
pkgrel=1
pkgdesc="A cross-platform, aesthetic, distraction-free Markdown editor"
arch=('i686' 'x86_64')
url="https://github.com/wereturtle/ghostwriter"
license=('GPL3')
depends=('qt5-webkit' 'hunspell' 'hicolor-icon-theme')
makedepends=('qt5-tools')
optdepends=('multimarkdown: For alternative converter, superset of Markdown with various output formats'
            'pandoc: For Pandoc supported Markdown flavors and export to various formats'
            'cmark: For processing and rendering CommonMark')
source=("https://github.com/wereturtle/ghostwriter/archive/v${pkgver}.tar.gz")
md5sums=('f799f8d8b27f82f41d605522643e51c6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  lrelease translations/ghostwriter_*.ts
  qmake PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install INSTALL_ROOT="${pkgdir}"

  # Doc files
  install -Dm644 CREDITS.md \
    "${pkgdir}/usr/share/doc/${pkgname}/CREDITS.md"
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # License for resources
  install -Dm644 resources/COPYING \
    "${pkgdir}/usr/share/doc/${pkgname}/COPYING"
}
