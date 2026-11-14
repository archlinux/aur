# Maintainer: MeoArch <https://github.com/QwQdoge>
_srcdir=MeoSettings-13048c7fcf9572eb0a4588378f06c160b4aaa5e3
pkgname=meo-settings-beta
pkgver=0.2.0beta5
pkgrel=6
pkgdesc="Meo Settings application for MeoArch (Beta channel)"
arch=('x86_64')
conflicts=('meo-settings')
provides=('meo-settings=0.2.0beta5')
url='https://github.com/QwQdoge/MeoSettings'
license=('GPL-3.0-or-later')
depends=('meo-account' 'meo-icon-studio>=0.1.0' 'meoui-qml>=1.0.4beta1' 'meo-kde-runtime>=0.4.0beta3-7'
         'qt6-declarative' 'qt6-svg' 'qt6-multimedia' 'kservice' 'libkscreen>=6.8' 'kconfig' 'kcoreaddons' 'ki18n' 'solid')
makedepends=('cmake' 'ninja' 'qt6-tools' 'extra-cmake-modules')
source=('MeoSettings-13048c7fcf9572eb0a4588378f06c160b4aaa5e3.tar.gz::https://codeload.github.com/QwQdoge/MeoSettings/tar.gz/13048c7fcf9572eb0a4588378f06c160b4aaa5e3')
sha256sums=('108e17ca3fe9495ce91d7e40d7f66a0d115f2a773a16d85fe941e11bf17cd5fa')

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
