pkgname=element
pkgver=0.42.0
_pkgname=${pkgname}-${pkgver}
pkgrel=1
pkgdesc="Element Audio Plugin Host."
arch=('x86_64')
url="https://github.com/kushview/Element"
license=('GPL3')
depends=('alsa-lib' 'boost' 'freetype2' 'ladspa' 'libxcomposite' 'libxcursor'
         'libxext' 'libxinerama' 'lilv' 'lv2' 'python' 'suil' 'xorg-xrandr')
makedepends=('git' 'pkgconf')
conflicts=("${pkgname}-git")
source=("${url}/releases/download/${pkgver}/element-${pkgver}.tar.gz")
sha256sums=('6a413cd3a91fd558e69dd4e4ae04988eeff3f7aa51d82c0c38cfb43ed64f1b17')

prepare() {
  cd "${_pkgname}"
  git submodule update --init
  python ./waf configure --prefix=/usr
}
build() {
  cd "${_pkgname}"
  python ./waf
}
package() {
  cd "${_pkgname}"
  python ./waf install --destdir="${pkgdir}" 
}
