# Maintaner: Francesco Masala <mail@francescomasala.me>
# Contributor: Francesco Masala <mail@francescomasala.me>

pkgname=bottles
pkgver=2022.6.14
pkgrel=8
pkgdesc='Easily manage wine and proton prefix'
arch=('x86_64')
url="https://github.com/bottlesdevs/Bottles"
license=('GPL3')
depends=(
  'gtksourceview4'
  'libhandy'
  'imagemagick'
  'pefile'
  'lib32-gnutls'
  'gtk4'
  'gtksourceview5'
  'hicolor-icon-theme' 
  'dconf' 
  'python' 
  'gtk3' 
  'patool' 
  'p7zip' 
  'python-gobject' 
  'python-requests' 
  'python-yaml' 
  'python-markdown'
  'wine' 
  'cabextract'
  'webkit2gtk'
  'xorg-xdpyinfo'
  'icoextract')
optdepends=(
  'gvfs' 
  'vkd3d' 
  'lib32-vkd3d' 
  'lib32-vulkan-icd-loader' 
  'vulkan-icd-loader'
  'gamemode')
makedepends=('meson' 'ninja')
source=("${pkgname}-2022.5.28-trento-3.tar.gz::https://github.com/bottlesdevs/Bottles/archive/2022.5.28-trento-3.tar.gz")
sha256sums=('07d8a054abfe8393ae8115761ce4a709735ebb4455a2a923785c9d2ae042949f')

build() {
  if [[ -d Bottles ]]; then 
        rm -rf Bottles
  fi;
  mv Bottles*/ Bottles/
  cd "Bottles"
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "Bottles"
  DESTDIR="${pkgdir}" ninja -C build install
}
