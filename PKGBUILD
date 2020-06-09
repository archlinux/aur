# Maintainer: Sauyon Lee <me at sjl dot re>
pkgname=codeql
pkgver=2.2.0
pkgrel=1
epoch=
pkgdesc="The CLI tool for GitHub's CodeQL"
arch=('i686' 'x86_64')
url="https://github.com/codeql"
license=('custom')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-v$pkgver.zip::https://github.com/github/codeql-cli-binaries/releases/download/v$pkgver/$pkgname-linux64.zip")
sha256sums=('a4f6540ea948f6fcdf698790708043a748321cec92bcae2a5ed810ed44ff16ea')

noextract=()

prepare() {
  cd "$srcdir"

  # remove useless windows and osx binaries
  LANGS=("" cpp csharp go)
  for lang in "${LANGS[@]}"; do
    rm -rf "$pkgname/$lang/tools/osx64"
    rm -rf "$pkgname/$lang/tools/win64"
  done
  rm -rf "$pkgname/java/tools/macos"
  rm -rf "$pkgname/java/tools/windows"

  cp "codeql/tools/linux64/lib64trace.so" "codeql/tools/linux64/libtrace.so"
}

package() {
  cd "$srcdir"

  install -Dm644 codeql/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/opt"
  cp -r "codeql" "$pkgdir/opt/$pkgname"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "../../opt/$pkgname/codeql" "$pkgdir/usr/bin/codeql"
}

# vim:set ts=2 sw=2 et:
