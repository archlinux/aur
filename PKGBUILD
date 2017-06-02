# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Bastien "neitsab" Traverse <firstname [at] lastname [dot] email>
# Contributor: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=ghostwriter
pkgver=1.5.0
pkgrel=2
pkgdesc="A cross-platform, aesthetic, distraction-free Markdown editor"
arch=('i686' 'x86_64')
url="https://github.com/wereturtle/ghostwriter"
license=('GPL3')
depends=('qt5-webkit' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'hunspell')
optdepends=('multimarkdown: For alternative converter, superset of Markdown with various output formats'
            'pandoc: For Pandoc supported Markdown flavors and export to various formats'
            'cmark: For processing and rendering CommonMark'
            'hunspell: For spell checking')
provides=('ghostwriter')
conflicts=('ghostwriter' 'ghostwriter-git')
source=("https://github.com/wereturtle/ghostwriter/archive/v${pkgver}.tar.gz")
md5sums=('46788d672481f9750293eb71eced35b7')

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
