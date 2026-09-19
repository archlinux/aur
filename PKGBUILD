# Maintainer: itonia149 <283548443+itonia149@users.noreply.github.com>
pkgname=quantum-desktop
pkgver=1.0.1
pkgrel=1
pkgdesc='Local FileBrowser Quantum desktop integration with browser-based file management'
arch=('x86_64')
url='https://github.com/itonia149/quantum-desktop'
license=('MIT' 'Apache-2.0')
depends=('python>=3.10' 'systemd' 'microsoft-edge-stable-bin')
checkdepends=('desktop-file-utils')
optdepends=('ffmpeg: video previews and thumbnails')
options=('!strip' '!debug')
_qver=1.5.6-stable
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "quantum-$_qver::https://github.com/gtsteffaniak/filebrowser/releases/download/v$_qver/linux-amd64-filebrowser"
        "quantum-LICENSE-$_qver::https://raw.githubusercontent.com/gtsteffaniak/filebrowser/v$_qver/LICENSE")
sha256sums=('0522e460ef86c1ae28754e88c6bf6240b7dbbf04aea408e2d7858bc9a3485199'
            'febf1ded3368eac1f13481f413db272c57678b70f09e74f5513d5e25e0bfb0e5'
            '47ce67778fa9640ab20c2414ab2d073430099bbbf6de163f8d215d3abc4a171c')
check() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m unittest -v
  desktop-file-validate packaging/filebrowser-quantum-local.desktop
}
package() {
  install -Dm755 "$srcdir/quantum-$_qver" "$pkgdir/usr/lib/$pkgname/filebrowser"
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 quantum-desktop "$pkgdir/usr/bin/quantum-desktop"
  install -Dm755 quantum-desktop-setup "$pkgdir/usr/bin/quantum-desktop-setup"
  install -Dm644 packaging/filebrowser-quantum-local.desktop "$pkgdir/usr/share/applications/filebrowser-quantum-local.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/quantum-LICENSE-$_qver" "$pkgdir/usr/share/licenses/$pkgname/QUANTUM-LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
