# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=bun
pkgver=0.1.11
pkgrel=1
pkgdesc="A runtime for JavaScript and TypeScript"
arch=('x86_64' 'aarch64')
url="https://github.com/Jarred-Sumner/bun-releases-for-updater"
license=(MIT)
provides=(bun)
source_x86_64=(${pkgname}-${pkgver}.zip::$url/releases/download/$pkgname-v$pkgver/$pkgname-linux-x64.zip)
sha256sums_x86_64=('3778463f2a7dc2f6fb8e3a5a14b25c74d211c8bbde82301ef8c895d9a312d671')
sha256sums_aarch64=('2920b881db09649a0f8cc12cf958a056eaa5503860e2c2f4e785919406c1f9e0')
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
