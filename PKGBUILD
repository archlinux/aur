# Maintainer: Andrius Pukšta <andrius.puksta at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mangareader
pkgver=2.4.0
pkgrel=1
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
sha256sums=('8c19856110256702563dd1e7513878a4fc4212390b409e7030c7a604f8745834')

build() {
  cmake -S $pkgname-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
