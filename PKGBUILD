# Maintainer: willemw <willemw12@gmail.com>

pkgname=daily-wallpaper-git
pkgver=r100.42041bf
pkgrel=1
pkgdesc="Change wallpaper automatically with the Photo of The Day of your favorite source"
arch=('x86_64')
url="https://github.com/atareao/daily-wallpaper"
license=('MIT')
depends=('dbus-python' 'python-gobject' 'python-lxml' 'python-cssselect' 'python-requests' 'python-crontab' 'python-plumbum' 'gtk3' 'libnotify')
optdepends=('cron: automatic download')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname

  install -dm755 "$pkgdir/usr"
  cp -a bin      "$pkgdir/usr"

  install -dm755 "$pkgdir/usr/share/daily-wallpaper"
  cp -a src/*.py "$pkgdir/usr/share/daily-wallpaper"

  install -dm755    "$pkgdir/usr/share/daily-wallpaper"
  cp -a src/dailies "$pkgdir/usr/share/daily-wallpaper"

  install -dm755           "$pkgdir/usr/share/icons"
  cp -a data/icons/hicolor "$pkgdir/usr/share/icons"

  install -dm755                     "$pkgdir/usr/share/applications"
  cp -a data/daily-wallpaper.desktop "$pkgdir/usr/share/applications"
}

