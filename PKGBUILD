# Maintaner: Francesco Masala <mail@francescomasala.me>
# Contributor: Francesco Masala <mail@francescomasala.me>

pkgname=bottles
pkgver=2022.8.28
pkgrel=1
epoch=1
pkgdesc='Easily manage wine and proton prefix'
arch=('x86_64')
url="https://github.com/bottlesdevs/Bottles"
license=('GPL3')
depends=(
  'cabextract'
  'dconf'
  'fvs'
  'gtk4'
  'gtksourceview5'
  'hicolor-icon-theme'
  'icoextract'
  'imagemagick'
  'lib32-gnutls'
  'libadwaita'
  'libhandy'
  'libportal-gtk4'
  'p7zip'
  'patool'
  'python'
  'python-gobject'
  'python-markdown'
  'python-orjson'
	'python-pillow'
  'python-requests'
  'python-steamgriddb'
  'python-yaml'
  'webkit2gtk'
  'xorg-xdpyinfo')
optdepends=(
  'gamemode'
  'gvfs' 
  'lib32-vkd3d' 
  'lib32-vulkan-icd-loader' 
  'vkd3d' 
  'wine'
  'vulkan-icd-loader')
makedepends=('meson' 'ninja') # 'blueprint-compiler' will be needed since 2022.9.28
source=("${pkgname}-${pkgver}-brescia-2.tar.gz::https://github.com/bottlesdevs/Bottles/archive/${pkgver}-brescia-2.tar.gz")
sha256sums=('85d83092f1b8884650811009ca601741b801b482f2c6bf974b0ccb4c42c02b15')

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
