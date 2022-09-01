# Maintainer: gbr <gbr@protonmail.com>
pkgname=maxautoclicker
pkgver=1.5.8
pkgrel=2
pkgdesc='Emulate and automate your mouse clicks'
arch=('x86_64')
url='https://maxautoclicker.blogspot.com/'
license=('custom')
depends=('gtk2' 'libxtst')
source=("https://github.com/mautosoft/$pkgname/releases/download/v$pkgver/$pkgname-${pkgver}_amd64.deb")
sha256sums=('1d933f74bb01530bff791e69b789ccb13b877dee834b05c36792ae31186faba4')

prepare() {
  mkdir $pkgname-$pkgver
  tar -xf data.tar.xz -C $pkgname-$pkgver
  sed -i '/^Icon=/c Icon=maxautoclicker' "$pkgname-$pkgver/usr/share/applications/$pkgname.desktop"
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 -t "$pkgdir/usr/bin" "usr/bin/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/applications" "usr/share/applications/$pkgname.desktop"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/256x256/apps" "usr/share/$pkgname/$pkgname.png"
  install -Dm644 "usr/share/doc/$pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
