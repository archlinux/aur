# Maintainer: xsmile <>

pkgname=myetherwallet
_pkgname=etherwallet
pkgver=3.39.0
pkgrel=1
pkgdesc='Free, open-source, client-side tool for easily & securely interacting with the Ethereum network'
arch=('any')
depends=('xdg-utils')
url='https://github.com/kvhnuke/etherwallet'
license=('MIT')
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver.zip"{,.sig}
        'myetherwallet.desktop'
        'myetherwallet'
        'LICENSE')
sha256sums=('46776f7e357f3334a773f486048f47d83c67ee2439d973ee872403db1f91cfb1'
            'SKIP'
            '08fca55eaa60eca466f75a9961aa792442e36ae6740f31ff9c0dbfa888f9a45f'
            '7f53205c3ee5ca028aa9ef69544de8befdc25670dfbd45203ea8d81539e3ca7e'
            '6d8c51c704f3a16402bc9eceb01273d7fbad1f1a4e8770a26dfd35b531101d34')
validpgpkeys=('2FCA4A1E3AF4278F7AD3B7637F059C0F7B9A12F0')

package() {
  cd "$srcdir/$_pkgname-v$pkgver"

  # Lib directory
  install -d "$pkgdir/opt/$pkgname"
  cp -a css fonts images js *.html "$pkgdir/opt/$pkgname"
  # Executable
  install -Dm755 "$srcdir/$pkgname" -t "$pkgdir/usr/bin"

  # License
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
  # Menu entry
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "images/fav/android-chrome-192x192.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
