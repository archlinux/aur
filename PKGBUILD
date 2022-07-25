# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=bun
pkgver=0.1.5
pkgrel=2
pkgdesc="A runtime for JavaScript and TypeScript"
arch=('x86_64' 'aarch64')
url="https://github.com/Jarred-Sumner/bun-releases-for-updater"
license=(MIT)
provides=(bun)
source_x86_64=(${pkgname}-${pkgver}.zip::$url/releases/download/$pkgname-v$pkgver/$pkgname-linux-x64.zip)
sha256sums_x86_64=('524a2d7e51ddda4786799552ae1c18ab8e6173bb30f158f26cae899a7e74f22f')
sha256sums_aarch64=('6b22b6221014fed9e6b6cb432505424e618ef095b2060945ad119cd8f2155fae')
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
