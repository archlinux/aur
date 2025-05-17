pkgname=pliner
pkgver=0.1.5
pkgrel=1
pkgdesc="Pliner — task manager with life-process philosophy"
arch=('x86_64')
url="https://github.com/nicourrrn/pliner"
license=('MIT')
depends=('fvm' 'glibc')
makedepends=('git' 'fvm' 'cmake' 'ninja')
source=("git+$url.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  fvm flutter pub get
  fvm flutter build linux --release
}

package() {
  install -d "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/$pkgname/build/linux/x64/release/bundle/." "$pkgdir/opt/$pkgname/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/self_process_manager_front" "$pkgdir/usr/bin/pliner"

  install -d "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/pliner/linux/pliner.desktop" "$pkgdir/usr/share/applications/pliner.desktop"

  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 "$srcdir/pliner/assets/icon/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/pliner.png"
}
