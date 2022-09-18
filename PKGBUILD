# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=bun
pkgver=0.1.12
pkgrel=1
pkgdesc="A runtime for JavaScript and TypeScript"
arch=('x86_64' 'aarch64')
url="https://github.com/Jarred-Sumner/bun-releases-for-updater"
license=(MIT)
provides=(bun)
source_x86_64=(${pkgname}-${pkgver}.zip::$url/releases/download/$pkgname-v$pkgver/$pkgname-linux-x64.zip)
sha256sums_x86_64=('75c1b8521fd3bd846dc2b7179a9adf78752eef8c0bb969977da91035a565d99d')
sha256sums_aarch64=('efe2b03069c9413a66bc984693da2058e86a5168a0facd6b7b2920398dd2ac76')
source_aarch64=(${pkgname}-${pkgver}-aarch64.zip::$url/releases/download/$pkgname-v$pkgver/$pkgname-linux-aarch64.zip)

package() {
  if [[ $CARCH == 'x86_64' ]]; then
    cd "$srcdir/$pkgname-linux-x64"
  else
    cd "$srcdir/$pkgname-linux-$CARCH"
  fi

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp bun "$pkgdir/usr/lib/$pkgname/"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/$pkgname/bun $pkgdir/usr/bin/$pkgname
}
