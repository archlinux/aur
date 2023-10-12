# Maintainer: crimist <aur at crim dot ist>
# Contributor: skrewball <aur at joickle dot com>

pkgname=gnome-shell-extension-color-picker
_pkgbase=tuberry-color-picker
pkgver=38
_commit=455de8f
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
sha256sums=('558f5338a87f926d965cfd9bf8f26f48223367b53300b17c2d41e30bfd83023f'
            'a7ce4d4aec881a2f5505f13506eb5139f1ab3cc1192be916c8ad59686c3b6919')

prepare() {
  cp -r gnome-shell-sass-${_sass_commit}/. ${_pkgbase}-${_commit}/res/styles/gnome-shell-sass
}

build() {
  arch-meson $_pkgbase-$_commit build -Dversion=${pkgver} -Dtarget=system
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
