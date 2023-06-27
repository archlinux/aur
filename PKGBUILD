# Maintainer: willemw <willemw12@gmail.com>

pkgname=daily-wallpaper-git
pkgver=0.8.0.r9.gad7fb04
pkgrel=2
pkgdesc="Change wallpaper automatically with a photo of the day"
arch=('any')
url="https://github.com/atareao/daily-wallpaper"
license=('MIT')
depends=('dbus-python' 'python-gobject' 'python-lxml' 'python-cssselect' 'python-requests' 'python-python-crontab' 'python-plumbum' 'gtk3' 'libnotify')
optdepends=('cron: automatic download')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $pkgname

  install -Dm755 bin/daily-wallpaper                   -t "$pkgdir/usr/bin"
  install -Dm644 data/daily-wallpaper.{service,timer}  -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 data/daily-wallpaper.desktop          -t "$pkgdir/usr/share/applications"
  install -Dm644 src/dailies/*                         -t "$pkgdir/usr/share/${pkgname%-git}/dailies"
  install -Dm644 LICENSE                               -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  #install -Dm644 src/*.py src/dailies/*                -t "$pkgdir/usr/share/${pkgname%-git}"
  install -dm755 "$pkgdir/usr/share/${pkgname%-git}"
  cp -a src/*.py "$pkgdir/usr/share/${pkgname%-git}"

  install -dm755           "$pkgdir/usr/share/icons"
  cp -a data/icons/hicolor "$pkgdir/usr/share/icons"
}

