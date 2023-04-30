# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Helder Bertoldo <helder.bertoldo@gmail.com>

_pkgname=tuner
pkgname=$_pkgname-git
pkgver=1.5.1.r31.7ecfdfb
pkgrel=2
pkgdesc="GNU/Linux app to discover and play internet radio stations. Geared towards RadioBrowser"
arch=('i686' 'x86_64')
url="https://codeberg.org/$_pkgname/$_pkgname"
license=('GPL3')
depends=('granite' 'gst-plugins-bad-libs' 'geoclue')
optdepends=('gst-libav: play AAC[+] streams')
makedepends=('git' 'meson' 'vala')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "${_pkgname}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${_pkgname}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}
