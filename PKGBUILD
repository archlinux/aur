# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=bun
pkgver=0.1.9
pkgrel=1
pkgdesc="A runtime for JavaScript and TypeScript"
arch=('x86_64' 'aarch64')
url="https://github.com/Jarred-Sumner/bun-releases-for-updater"
license=(MIT)
provides=(bun)
source_x86_64=(${pkgname}-${pkgver}.zip::$url/releases/download/$pkgname-v$pkgver/$pkgname-linux-x64.zip)
sha256sums_x86_64=('5e2ce55420f5c19221e18b8a77f3044f158c3c6175df81ff75436ca5f4616812')
sha256sums_aarch64=('ad7ecd6be924ae494b94a1627fad0340d032ba17fc1e7a02c0c316ff5772bb8f')
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
