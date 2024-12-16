# Maintaner: Francesco Masala <mail@francescomasala.me>
# Contributor: lotation <xlapsiu@gmail.com>

pkgname=bottles
pkgver=51.17
pkgrel=1
epoch=2
pkgdesc='Easily manage wine and proton prefix'
arch=(any)
url="https://github.com/bottlesdevs/Bottles"
license=('GPL-3.0-only')
depends=(
  'cabextract'
  'dconf'
  'gtk4'
  'gtksourceview5'
  'hicolor-icon-theme'
  'icoextract'
  'imagemagick'
  'libadwaita'
  'libportal-gtk4'
  'p7zip'
  'patool'
  'python'
  'python-chardet'
  'python-fvs'
  'python-gobject'
  'python-markdown'
  'python-orjson'
  'python-pathvalidate'
  'python-pycurl'
  'python-requests'
  'python-steamgriddb'
  'python-yaml'
  'webkit2gtk'
  'xorg-xdpyinfo'
  'vkbasalt-cli'
)
optdepends=(
  'gamemode'
  'gvfs' 
  'lib32-gamemode'
  'lib32-gnutls'
  'lib32-vkd3d' 
  'lib32-vulkan-icd-loader' 
  'vkd3d'
  'vulkan-icd-loader'
  'wine'
)
makedepends=('meson' 'ninja' 'blueprint-compiler')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bottlesdevs/Bottles/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f0fdb62e2093206e46f9ceda94726927fc28436e253c89be3e0c248c975baf91')

build() {
  if [[ -d Bottles ]]; then 
        rm -rf Bottles
  fi;
  mv Bottles*/ Bottles/
  cd "Bottles"
  meson setup --prefix='/usr' build
  ninja -C build
}

package() {
  cd "Bottles"
  DESTDIR="${pkgdir}" ninja -C build install
}

