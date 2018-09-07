# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Bastien "neitsab" Traverse <firstname [at] lastname [dot] email>
# Contributor: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=ghostwriter
pkgver=1.7.3
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
sha512sums=('a6f7e64078bdb3ecd9ea48ead8e96811e62215292a1c4a269f23efb6c0403c62fb0aab3e1303397b08036a7f3507d04a8eb8c14baafd78f64fea20805bb24a5a')

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
