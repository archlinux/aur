# Maintaner: Francesco Masala <mail@francescomasala.me>
# Contributor: Francesco Masala <mail@francescomasala.me>

pkgname=bottles
pkgver=2022.5.14
pkgrel=4
pkgdesc='Easily manage wine and proton prefix'
arch=('x86_64')
url="https://github.com/bottlesdevs/Bottles"
license=('GPL3')
depends=(
  'lib32-gnutls'
  'gtksourceview4'
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
source=("${pkgname}-${pkgver}-trento-3.tar.gz::https://github.com/bottlesdevs/Bottles/archive/${pkgver}-trento-3.tar.gz")
sha256sums=('e000e007380d801c350bd3a7f47ba24bc132c1eb423bcba318da994e2b865d20')

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
