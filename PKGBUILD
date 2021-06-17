# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=gpodder-adaptive-git
_pkgname=gpodder
pkgver=3.10.19+1.r0.g87a607f6
pkgrel=1
pkgdesc='Podcast client written in Python using GTK'
arch=('any')
url='https://gpodder.github.io/'
provides=('gpodder')
conflicts=('gpodder' 'gpodder-git')
license=('GPL3')
depends=('gtk3' 'python-cairo' 'dbus-python' 'python-gobject' 'python-mygpoclient'
         'python-podcastparser' 'python-requests' 'libhandy')
makedepends=('intltool' 'git')
optdepends=('libnotify: Gtk+ Desktop Notifications extension'
            'python-mutagen: Tag downloaded files, Remove cover art from OGG files extensions'
            'webkit2gtk: HTML show notes'
            'youtube-dl: Youtube-dl extension')
source=("git+https://github.com/gpodder/gpodder#branch=adaptive")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g' | sed -r 's/adaptive\///g'
}

prepare() {
  cd $_pkgname
  # Use gio open directly instead of xdg-open
  sed -i "s/\['xdg-open', filename\]/['gio', 'open', filename]/" src/gpodder/util.py
}

build() {
  cd $_pkgname
  make messages
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
