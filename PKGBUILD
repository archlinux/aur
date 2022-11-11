# Maintainer: willemw <willemw12@gmail.com>

pkgname=better-adb-sync-git
pkgver=r61.6b1e982
pkgrel=1
pkgdesc='Synchronize files between a PC and an Android device using the ADB (Android Debug Bridge)'
arch=('any')
url='https://github.com/SelfAdjointOperator/better-adb-sync'
license=('Apache')
depends=('android-tools' 'android-udev' 'python')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755       "$pkgdir/usr/share/${pkgname%-git}"
  cp -r $pkgname/src/* "$pkgdir/usr/share/${pkgname%-git}"

  install -dm755                                "$pkgdir/usr/bin"
  ln -s "/usr/share/${pkgname%-git}/adbsync.py" "$pkgdir/usr/bin/adbsync.py"
}

