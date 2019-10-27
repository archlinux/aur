# Maintainer: Milk Brewster <aurentry@milkmiruku.com>
pkgname=element-git
pkgver=0.40.0.r17.gbd619ea
pkgrel=1
epoch=
pkgdesc="a modular AU/LV2/VST/VST3 audio plugin host."
arch=('x86_64')
url="https://github.com/kushview/Element"
license=('GPL')
groups=()
depends=('python' 'boost' 'freetype2' 'libxext' 'xorg-xrandr' 'alsa-lib' 'lv2' 'lilv' 'ladspa' 'suil')
makedepends=('git' 'pkgconf')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("element-git::git+https://github.com/kushview/Element")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$pkgname"
  git submodule update --init
  python2 ./waf configure --prefix=/usr
}

build() {
	cd "$pkgname"
  python2 ./waf
}

package() {
	cd "$pkgname"
  python2 ./waf install --destdir="${pkgdir}" 
}
