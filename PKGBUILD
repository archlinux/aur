# Maintainer: willemw <willemw12@gmail.com>

_pkgname=national-geographic-wallpaper
pkgname=$_pkgname-git
pkgver=r29.e9e5e6d
pkgrel=1
pkgdesc="Change wallpaper automatically, for example, with the Photo of The Day of National Geographic"
arch=('any')
url="https://github.com/atareao/national-geographic-wallpaper"
license=('GPL3')
makedepends=('git')
#'python-crontab' 'python-crontab2'
depends=('gtk-update-icon-cache' 'gtk3' 'libnotify' 'python-cssselect' 'python-gobject' 'python-lxml' 'python-requests')
#optdepends=('cron: automatic download')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
source=($pkgname::git://github.com/atareao/national-geographic-wallpaper.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  sed -i 's|/opt/extras.ubuntu.com|/opt|g' data/extras-national-geographic-wallpaper.desktop \
                                           data/national-geographic-wallpaper-autostart.desktop \
                                           src/comun.py
}

package() {
  cd $pkgname

  install -dm755 "$pkgdir/opt/national-geographic-wallpaper/share/"{icons,national-geographic-wallpaper}

  cp -p src/*.py "$pkgdir/opt/national-geographic-wallpaper/share/national-geographic-wallpaper"
  install -Dm644 data/national-geographic-wallpaper-autostart.desktop \
                 "$pkgdir/opt/national-geographic-wallpaper/share/national-geographic-wallpaper"

  install -Dm644 data/national-geographic-wallpaper.svg \
                 "$pkgdir/opt/national-geographic-wallpaper/share/icons"

  install -Dm644 data/extras-national-geographic-wallpaper.desktop \
                 "$pkgdir/usr/share/applications/national-geographic-wallpaper.desktop"
}

