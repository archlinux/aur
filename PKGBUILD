# Maintainer: Uladzimir Panasiuk <v.s.panasyuk at google dot com>

_pkgname=primus-vk
pkgname=lib32-$_pkgname-git
pkgver=r71.706bd87
pkgrel=1
pkgdesc="Primus-Vk Nvidia Vulkan offloading for Bumblebee, 32bit libs"
arch=('x86_64')
url="https://github.com/felixdoerre/primus_vk"
license=('BSD')
depends=('lib32-nvidia-utils' 'bumblebee' 'primus-vk-git' 'lib32-vulkan-icd-loader' 'lib32-primus')
makedepends=('vulkan-validation-layers' 'git')
source=(git+https://github.com/felixdoerre/primus_vk)
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname/-/_}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "${_pkgname/-/_}"

  CXXFLAGS+=' -m32 -DNV_DRIVER_PATH=\"/usr/lib32/libGLX_nvidia.so.0\"'
  make CXXFLAGS="$CXXFLAGS"
}

package() {
  cd "${_pkgname/-/_}"

  install -Dm755 libnv_vulkan_wrapper.so "$pkgdir"/usr/lib32/libnv_vulkan_wrapper.so
  install -Dm755 libprimus_vk.so "$pkgdir"/usr/lib32/libprimus_vk.so
}

