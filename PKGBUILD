# Maintainer: Toni500 <tonino512@linuxmail.org>
_pkgver=0.5.0-rc3
pkgname="oshot-bin"
_pkgname="oshot"
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A fast and lightweight screenshot tool for extracting text on the fly (binary files)"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/oshot"
license=('BSD-3-Clause')
depends=(
  'libx11'
  'libxcb'
  'libpng'
  'glfw'
  'tesseract'
  'tesseract-data-eng'
  'zbar'
  'libappindicator-gtk3'
)
optdepends=(
	'grim: wlroots-based compositor screen capture'
	'wl-clipboard: Wayland clipboard'
)
conflicts=('oshot' 'oshot-git')
source=(
	"${url}/releases/download/v${_pkgver}/${_pkgname}-linux-x86_64-plugins-v${_pkgver}.zip"
)
sha256sums=('cc6e76a7863a16c7fd392b6ad65a6d84cec978c5dbd0295b1c70f389c227cb9a')

# Don't run refresh_caches() or else it's going to conflict with the system's cache
prepare() {
    cd "${srcdir}/${_pkgname}/"
    sed -i -E 's/^([[:space:]]*)refresh_caches([[:space:]].*)?$/\1:/' install.sh
}

package() {
    cd "${srcdir}/${_pkgname}/"
    PREFIX=${pkgdir}/usr ./install.sh
}
