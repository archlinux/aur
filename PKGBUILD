# Maintainer: Sergei Marochkin <me@ziggi.org>
# Maintainer: Ivan Burmin <zirrald@yandex.ru>
# Maintainer: Sergei Snitsky <stalker.medik@gmail.com>

pkgname='yandex-disk-indicator'
pkgver=1.11.0.139e473
pkgrel=1
pkgdesc="Panel indicator (GUI) for YandexDisk CLI client for Linux."
arch=('i686' 'x86_64')
url="https://github.com/slytomcat/${pkgname}/"
license=('GPL3')
depends=('yandex-disk' 'python' 'python-pyinotify' 'pygobject-devel' 'python-gobject' 'libappindicator-gtk3' 'xclip' 'zenity')
source=("$pkgname::git+https://github.com/slytomcat/${pkgname}.git")
sha1sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname/build
  chmod +x prepare.sh
}

package() {
    mkdir $pkgdir/usr
    cd $pkgname/build
    export TARGET="$pkgdir/usr"
    sh prepare.sh
}
