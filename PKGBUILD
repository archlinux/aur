# Maintainer: crimist <aur at crim dot ist>
# Contributor: skrewball <aur at joickle dot com>

pkgname=gnome-shell-extension-color-picker
_pkgbase=tuberry-color-picker
pkgver=37
_commit=e0877dd
pkgrel=1
pkgdesc='Simple color picker for Gnome Shell'
arch=(any)
url='https://github.com/tuberry/color-picker'
license=('GPL3')
depends=('dconf' 'gnome-shell')
makedepends=('git' 'meson' 'ninja' 'sassc')
source=("${_pkgbase}-${pkgver}.tar.gz::${url}/tarball/${_commit}"
        "git+https://gitlab.gnome.org/GNOME/gnome-shell-sass.git")
sha256sums=('721c74569febe9e008881ada90307b4d86de65e4c076c9a218426ec96de7cb6a'
            'SKIP')

prepare() {
  cd "${_pkgbase}-${_commit}/res/styles/"
  git -C gnome-shell-sass pull || git clone https://gitlab.gnome.org/GNOME/gnome-shell-sass.git
}

build() {
  cd "${_pkgbase}-${_commit}"
  LANG=${LANG} meson setup build
}

package() {
  cd "${_pkgbase}-${_commit}"
  meson install -C build --destdir "$pkgdir"
}
