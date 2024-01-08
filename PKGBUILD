# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Daniel Kaes (daniel.kaes@web.de)

pkgname=wiki2beamer
pkgver=0.10.0
pkgrel=1
pkgdesc="wiki2beamer is a small tool to create LaTeX Beamer presentations from text files with a wiki-like syntax. Thus, it enables the user to create beamer presentations in a less time-consuming way."
url='https://wiki2beamer.github.io/'
arch=(any)
license=('GPL2')
depends=('python')
makedepends=(asciidoctor)
source=("https://github.com/wiki2beamer/wiki2beamer/archive/refs/tags/wiki2beamer-v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-v${pkgver}/code"

  python -m build --wheel

  asciidoctor -b manpage -d manpage ../doc/man/wiki2beamer.adoc
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-v${pkgver}/code"

  python -m installer --destdir="${pkgdir}" dist/wiki2beamer-${pkgver}-py3-none-any.whl

  install -D ../doc/man/wiki2beamer.1 "${pkgdir}"/usr/share/man/man1/wiki2beamer.1
}

sha256sums=('e9662674cbf6b859bc1847e0dfa9cc89b1c2e1d1e0f727285de9a374875cb6a7')
