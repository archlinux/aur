# Maintainer: Popolon <popolon@popolon.org>

pkgname=networktablet
pkgver=1.5
pkgrel=3
pkgdesc="Linux driver for Android GfxTablet input"
arch=(x86_64 armv7h armv8)
url="https://github.com/rfc2822/GfxTablet"
license=('GPL3')
source=("https://github.com/rfc2822/GfxTablet/archive/android-app-1.4-linux-driver-$pkgver.tar.gz"
        'networktablet.service')
sha512sums=('3f56c4982c95d0be4588424af9c8046e59a4bd7f310738fdc6099a4f93e1b58bf82d8730139167f74d86001e31fd6def20752405c15683ceeb04f7efa3f7c801'
'a13131f6fc19a437cb5173ad48dae2d26fc85036bc9181ebb680654060f7ef4ea908d198dc9a4939ba4207281cecf5bd877eb525cb7c82a6bc74dceca67eb4bb'
)

build() {
  cd GfxTablet-android-app-1.4-linux-driver-$pkgver/driver-uinput/
  make
}

package() {
  install -Dm 644 networktablet.service "$pkgdir"/usr/lib/systemd/user/networktablet.service  
  cd GfxTablet-android-app-1.4-linux-driver-$pkgver
  install -D driver-uinput/networktablet "$pkgdir"/usr/bin/networktablet
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
