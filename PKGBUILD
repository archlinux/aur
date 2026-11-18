# Maintainer: MeoArch <https://github.com/QwQdoge>
_srcdir=MeoSettings-cd4c898c15f7c88564db6692314d1062d823da97
pkgname=meo-settings-beta
pkgver=0.2.0beta5
pkgrel=7
pkgdesc="Meo Settings application for MeoArch (Beta channel)"
arch=('x86_64')
conflicts=('meo-settings')
provides=('meo-settings=0.2.0beta5')
url='https://github.com/QwQdoge/MeoSettings'
license=('GPL-3.0-or-later')
depends=('meo-account' 'meo-icon-studio>=0.1.0' 'meoui-qml>=1.0.4beta1' 'meo-kde-runtime>=0.4.0beta3-7'
         'qt6-declarative' 'qt6-svg' 'qt6-multimedia' 'kservice' 'libkscreen>=6.8' 'kconfig' 'kcoreaddons' 'ki18n' 'solid')
makedepends=('cmake' 'ninja' 'qt6-tools' 'extra-cmake-modules')
source=('MeoSettings-cd4c898c15f7c88564db6692314d1062d823da97.tar.gz::https://codeload.github.com/QwQdoge/MeoSettings/tar.gz/cd4c898c15f7c88564db6692314d1062d823da97')
sha256sums=('802c837593a6a46b44993e9481f353bbe6e69de3ce876b310105ff344821cc43')

build() {
  cmake -S "$srcdir/$_srcdir" -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_LIBEXECDIR=lib -DBUILD_TESTING=OFF
  cmake --build build --parallel "${MEO_BUILD_PARALLEL_LEVEL:-1}"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/$_srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
