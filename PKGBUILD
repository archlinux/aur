# Maintaner: Francesco Masala <mail@francescomasala.me>
# Contributor:  Francesco Masala <mail@francescomasala.me>

pkgname=bottles
pkgver=2021.8.28
pkgrel=1
pkgdesc='Easily manage wine and proton prefix'
arch=('x86_64')
url="https://github.com/bottlesdevs/Bottles"
license=('GPL3')
depends=(
  'hicolor-icon-theme' 
  'dconf' 
  'python' 
  'libhandy' 
  'gtk3' 
  'patool' 
  'p7zip' 
  'python-gobject' 
  'python-requests' 
  'python-yaml' 
  'wine' 
  'cabextract')
optdepends=(
  'gvfs' 
  'vkd3d' 
  'lib32-vkd3d' 
  'lib32-vulkan-icd-loader' 
  'vulkan-icd-loader'
  'gamemode')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}-treviso-2.tar.gz::https://github.com/bottlesdevs/Bottles/archive/${pkgver}-treviso-2.tar.gz")
sha256sums=('5115f9d5a61a3088f0ce38e9abe3a3ae1ee0244dd2653ad731758a844d49c45d')

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
