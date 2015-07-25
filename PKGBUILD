# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Pietro Brenna <pietrobrenna@zoho.com>
# Contributor: Joey Dumont <joey.dumont@gmail.com>

pkgname=onedrive-d-git
pkgver=20150407.g62a0733
pkgrel=5
pkgdesc="Client daemon for Microsoft OneDrive service"
url="https://github.com/xybu92/onedrive-d"
license=('LGPL')
arch=('i686' 'x86_64')
provides='onedrive-d'
depends=('inotify-tools'
         'python-certifi'
         'python-click'
         'python-daemonocle'
         'python-gobject'
         'python-pip'
         'python-requests'
         'python-send2trash'
         'python-urllib3'
         'pywebkitgtk')
makedepends=('git')
source=('git+https://github.com/xybu92/onedrive-d'
        'onedrive-d.desktop')
md5sums=('SKIP'
         '8077d9697c922e003b8addbf243b33a4')

pkgver() {
  cd "$srcdir/onedrive-d"
  git log -1 --format="%cd.g%h" --date=short | sed 's/-//g'
}

build() {
  cd "$srcdir/onedrive-d"
  python setup.py build
}

package() {
  cd "$srcdir/onedrive-d"
  python setup.py install --root="$pkgdir/" --optimize=1
  python setup.py clean
  install -D onedrive_d/res/icon_256.png \
    "$pkgdir/usr/share/pixmaps/onedrive-d.png"
  install -D ../onedrive-d.desktop \
    "$pkgdir/usr/share/applications/onedrive-d.desktop"
}
