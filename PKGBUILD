# Maintainer: Paolo De Donato <dedonato95@hotmail.it>

pkgname=uwsm-git
pkgver=0.23.2.r0.g93bc364
pkgrel=1
pkgdesc='A standalone Wayland session manager - Git package'
url="https://github.com/Vladimir-csp/uwsm"
arch=(any)
license=(MIT)
depends=(bash
         python
         python-pyxdg
         python-dbus)
optdepends=('bemenu: optional picker for uuctl support'
            'dmenu: optional picker for uuctl support'
            'fuzzel: optional picker for uuctl support'
            'libnewt: for "uwsm start select"'
            'libnotify: for feeback from "uswm app" commands or fmon service'
            'rofi-wayland: optional picker for uuctl support'
          # 'tofi: optional picker for uuctl support' # not packaged
            'walker: optional picker for uuctl support'
            'wmenu: optional picker for uuctl support'
            'wofi: optional picker for uuctl support')
makedepends=(meson scdoc git)
conflicts=('uwsm')
provides=("uwsm=${pkgver}")
source=("uwsm::git+https://github.com/Vladimir-csp/uwsm.git")
sha256sums=('SKIP')

pkgver() {
  cd uwsm
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	arch-meson 'uwsm' build -Duuctl=enabled -Dfumon=enabled -Duwsm-app=enabled
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
