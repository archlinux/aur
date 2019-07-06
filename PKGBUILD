# Maintainer: Anton Semjonov < anton \ät semjonov.de >

pkgname="truepolyglot"
pkgdesc="Create polyglot files that are valid PDF and ZIP at the same time. See POC||GTFO 07."

pkgver=1.6.2
pkgrel=1

arch=("any")
url="https://git.hackade.org/truepolyglot.git/"
license=("UNLICENSE")

depends=("python")
makedepends=()

provides=($pkgname)
conflicts=($pkgname)

source=("${url}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=("4e16845f8ac92c2906ba5b8922d3ab1070e18ed265b9fe099f397424a30999fa")

package() {
  cd "${pkgname}-${pkgver}"
  dest="usr/share/truepolyglot"
  find -type f -name '*.py' ! -path 'tests/*' -exec install -v -D -m 644 {} "$pkgdir/$dest/{}" \;
  install -v -D -m 755 truepolyglot "$pkgdir/$dest/truepolyglot"
  install -v -d -m 755 "$pkgdir/usr/bin/"
  install -v -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -sv "/$dest/truepolyglot" "$pkgdir/usr/bin/truepolyglot"
}
