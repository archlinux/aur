# Maintainer: Andrius Pukšta <andrius.puksta at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mangareader
pkgver=2.3.0
pkgrel=2
pkgdesc='Manga Reader for local files'
arch=('x86_64')
url='https://github.com/g-fb/mangareader'
license=('GPL-3.0-or-later')
# KF6Archive is listed as optional in CMakeLists, but is in practice required
# gettext is mentioned as required in cmake build output
depends=('hicolor-icon-theme'
         'qt6-base'
         'karchive'
         'kcolorscheme'
         'kconfig'
         'kconfigwidgets'
         'kcoreaddons'
         'ki18n'
         'kio'
         'kxmlgui'
         'gettext')
# 'kimageformats' is not listed as a dependency in CMakeLists,
# but if present is loaded by KF automatically
optdepends=('kimageformats: extra image formats support (jxl, avif, heif, ...)')
# vulkan-headers is mentioned (as 'WrapVulkanHeaders') in cmake build
# output as optional
makedepends=('cmake' 'extra-cmake-modules' 'ninja' 'qt6-tools' 'vulkan-headers')
source=("https://github.com/g-fb/mangareader/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a15b1677ebb3f537bd069fd9ebf9c9011dc3e82a4a1071d501da231ea2fbc8a8')

build() {
  cmake -S $pkgname-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
