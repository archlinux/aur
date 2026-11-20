# Maintainer: LIghtJUNction <https://github.com/LIghtJUNction>
pkgname=zcall-omarchy
pkgver=0.1.0
pkgrel=1
pkgdesc='Native Omarchy menu and bar controls for the zcalld AI gateway'
arch=('any')
url='https://github.com/LIghtJUNction/zcall-omarchy'
license=('MIT')
depends=('python>=3.11' 'gum' 'omarchy>=4.5.0' 'zcalld>=0.2.0')
optdepends=('zcalld-compat: community providers, OAuth, privacy and advanced routing')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('15c7055caa34572229738c452191a448e0021247cca95e8954e036ef1b4866e9')

check() {
  cd "$pkgname-$pkgver"
  python -m unittest discover -s tests -v
}

package() {
  cd "$pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/share/$pkgname/bin" "$pkgdir/usr/share/$pkgname/lib" "$pkgdir/usr/bin"
  install -m755 bin/zcall-omarchy "$pkgdir/usr/share/$pkgname/bin/zcall-omarchy"
  install -m644 manifest.json BarWidget.qml VERSION "$pkgdir/usr/share/$pkgname/"
  cp -r lib/zcall_omarchy "$pkgdir/usr/share/$pkgname/lib/"
  find "$pkgdir/usr/share/$pkgname/lib" -type d -name __pycache__ -prune -exec rm -rf {} +
  find "$pkgdir/usr/share/$pkgname/lib" -type f -name '*.py' -exec chmod 644 {} +
  ln -s /usr/share/$pkgname/bin/zcall-omarchy "$pkgdir/usr/bin/zcall-omarchy"
  install -Dm644 share/zcall-omarchy.desktop "$pkgdir/usr/share/applications/zcall-omarchy.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/INTEGRATION.md "$pkgdir/usr/share/doc/$pkgname/INTEGRATION.md"
}
