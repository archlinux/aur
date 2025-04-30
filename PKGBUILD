# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: Frank Seifferth <frankseifferth@posteo.net>

pkgname=mkpdf
pkgver=0.3.2
pkgrel=2
pkgdesc="A simple wrapper around pandoc and latexmk"
arch=('any')
url="https://github.com/seifferth/mkpdf"
license=('GPL-3.0-only')
depends=(
  'biber'
  'pandoc'
  'texlive-binextra' # includes latexmk
)
optdepends=('python-langdetect: autodetect language of input document')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/seifferth/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('c7de43ada7c9ac7d97b44b53001594aca3c011b01451b18cfc8850bf46d6e83a116f75391a163b7937ef7361491fa3a76b572bab25fe5b5e7a2eb3df680b69b3')

build() {
  cd "$pkgname-$pkgver"
  make man
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "mkpdf" "$pkgdir/usr/bin/mkpdf"
  install -Dm 755 "furbishtex/furbishtex" "$pkgdir/usr/bin/furbishtex"
  install -Dm 644 "furbishtex/default.sed" "$pkgdir/usr/lib/furbishtex/default.sed"
  install -Dm 644 "mkpdf.1.gz" "$pkgdir/usr/share/man/man1/mkpdf.1.gz"
}
