# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Pietro Brenna <pietrobrenna@zoho.com>
# Contributor: Joey Dumont <joey.dumont@gmail.com>

pkgname=onedrive-d-git
_pkgname=onedrive-d-old
pkgver=20150921.ga28186b
pkgrel=1
pkgdesc="Client daemon for Microsoft OneDrive service"
url="https://github.com/xybu/onedrive-d-old"
license=('LGPL')
arch=('any')
provides=('onedrive-d')
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
source=('git+https://github.com/xybu/onedrive-d-old'
        'onedrive-d.desktop')
sha256sums=('SKIP'
            '97e59a5723f4772f00eb88eee48e9100fbe331a4d9043db0fddda8965bbe6817')

pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --format="%cd.g%h" --date=short | sed 's/-//g'
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  python setup.py clean
  install -D onedrive_d/res/icon_256.png \
    "$pkgdir/usr/share/pixmaps/onedrive-d.png"
  install -D ../onedrive-d.desktop \
    "$pkgdir/usr/share/applications/onedrive-d.desktop"
}
