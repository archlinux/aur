# Maintaner: Francesco Masala <mail@francescomasala.me>
# Contributor:  Francesco Masala <mail@francescomasala.me>

pkgname=bottles
pkgver=2021.11.28
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
  'python-markdown'
  'wine' 
  'cabextract'
  'webkit2gtk')
optdepends=(
  'gvfs' 
  'vkd3d' 
  'lib32-vkd3d' 
  'lib32-vulkan-icd-loader' 
  'vulkan-icd-loader'
  'gamemode')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}-treviso.tar.gz::https://github.com/bottlesdevs/Bottles/archive/${pkgver}-treviso.tar.gz")
sha256sums=('e8de9fc068e9f84901b4d4c1964c53316c6e4d699885b6027272bddab645d104')

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
