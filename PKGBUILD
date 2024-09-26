# Maintainer: crimist <aur at crim dot ist>
# Contributor: skrewball <aur at joickle dot com>

pkgname=gnome-shell-extension-color-picker
_pkgbase=tuberry-color-picker
pkgver=45
_commit=8bc65e9
_sass_commit=adeed6c9b448521bf044bb153f0f29dc950c33ea
pkgrel=1
pkgdesc='Simple color picker for Gnome Shell'
arch=(any)
url='https://github.com/tuberry/color-picker'
license=('GPL3')
depends=('dconf' 'gnome-shell')
makedepends=('meson' 'sassc')
source=("${_pkgbase}-${_commit}.tar.gz::${url}/tarball/${_commit}"
        "gnome-shell-sass-${_sass_commit}.tar::https://gitlab.gnome.org/GNOME/gnome-shell-sass/-/archive/${_sass_commit}/.tar")
sha256sums=('0dd484c8e6eece88e3e74be034302efa9d812e1988030f81fa2d737c9620fda3'
            'a7ce4d4aec881a2f5505f13506eb5139f1ab3cc1192be916c8ad59686c3b6919')

prepare() {
  cp -r gnome-shell-sass-${_sass_commit}/. ${_pkgbase}-${_commit}/res/style/gnome-shell-sass
}

build() {
  arch-meson $_pkgbase-$_commit build --reconfigure -Dversion=${pkgver} -Dtarget=system
}

package() {
  meson install -C build --destdir "$pkgdir"
}
