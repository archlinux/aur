pkgname=pheonix-nfx-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Cross-platform package manager for the Pheonix Studios ecosystem"

arch=('x86_64')

url="https://github.com/Pheonix-Studios-Git/NFX"

license=('MIT')

depends=('glibc')

provides=('nfx')
conflicts=('nfx')

groups=('pheonix-ecosystem')

options=('!strip')

source=(
  "NFX-v${pkgver}.zip::https://pheonix-studios-git.github.io/PPI/data/NFX/nfx_zip/NFX-v${pkgver}.zip"
)

sha256sums=('607db6d3b73ef02586605b9e3bb90621626ee6b9fddf99659a93182e857dea95')

prepare() {
  cd "$srcdir"
  bsdtar -xf NFX-v${pkgver}.zip
}

check() {
  "$srcdir/bin/linux/x86_64/dist/nfx" version >/dev/null
}

package() {
  install -Dm755 \
    "$srcdir/bin/linux/x86_64/dist/nfx" \
    "$pkgdir/usr/bin/nfx"

  if [[ -f "$srcdir/LICENSE" ]]; then
    install -Dm644 \
      "$srcdir/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi

  if [[ -f "$srcdir/README.md" ]]; then
    install -Dm644 \
      "$srcdir/README.md" \
      "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi

  if [[ -f "$srcdir/CHANGELOG.md" ]]; then
    install -Dm644 \
      "$srcdir/CHANGELOG.md" \
      "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  fi
}
