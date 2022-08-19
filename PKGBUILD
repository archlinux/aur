# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=bun
pkgver=0.1.10
pkgrel=1
pkgdesc="A runtime for JavaScript and TypeScript"
arch=('x86_64' 'aarch64')
url="https://github.com/Jarred-Sumner/bun-releases-for-updater"
license=(MIT)
provides=(bun)
source_x86_64=(${pkgname}-${pkgver}.zip::$url/releases/download/$pkgname-v$pkgver/$pkgname-linux-x64.zip)
sha256sums_x86_64=('6df8176519995bc9cb20baf06c53bc5d0f94ed9d9663ccf211b5c3f42b2af476')
sha256sums_aarch64=('cf5320cbc77b584e4b937163ed296eb2542f67c3570235d63680ee05bf568419')
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
