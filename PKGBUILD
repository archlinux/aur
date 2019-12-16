pkgname=element
pkgver=0.42.0.r0.gad065721
pkgrel=1
pkgdesc="Element Audio Plugin Host."
arch=('x86_64')
url="https://github.com/kushview/Element"
license=('GPL3')
depends=('alsa-lib' 'boost' 'freetype2' 'ladspa' 'libxcomposite' 'libxcursor'
         'libxext' 'libxinerama' 'lilv' 'lv2' 'python' 'suil' 'xorg-xrandr')
makedepends=('git' 'pkgconf')
source=("${pkgname}"::"git+${url}.git#tag=0.42.0")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
	cd "$pkgname"
  git submodule update --init
  python ./waf configure --prefix=/usr
}
build() {
	cd "$pkgname"
  python ./waf
}
package() {
	cd "$pkgname"
  python ./waf install --destdir="${pkgdir}" 
}
