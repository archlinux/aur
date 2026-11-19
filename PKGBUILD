# Maintainer: MeoArch <https://github.com/QwQdoge>
_srcdir=MeoSettings-26ebb1544f556eaec97f8ddb6c3bb66a0c9c8d33
pkgname=meo-settings-beta
pkgver=0.2.0beta5
pkgrel=8
pkgdesc="Meo Settings application for MeoArch (Beta channel)"
arch=('x86_64')
conflicts=('meo-settings')
provides=('meo-settings=0.2.0beta5')
url='https://github.com/QwQdoge/MeoSettings'
license=('GPL-3.0-or-later')
depends=('meo-account' 'meo-icon-studio>=0.1.0' 'meoui-qml>=1.0.4beta1' 'meo-kde-runtime>=0.4.0beta3-7'
         'qt6-declarative' 'qt6-svg' 'qt6-multimedia' 'kservice' 'libkscreen>=6.8' 'kconfig' 'kcoreaddons' 'ki18n' 'solid')
makedepends=('cmake' 'ninja' 'qt6-tools' 'extra-cmake-modules')
source=('MeoSettings-26ebb1544f556eaec97f8ddb6c3bb66a0c9c8d33.tar.gz::https://codeload.github.com/QwQdoge/MeoSettings/tar.gz/26ebb1544f556eaec97f8ddb6c3bb66a0c9c8d33')
sha256sums=('eb7cf4e00e4fb3f5ab09811da1b317ddf6e7672a11e144c35fef0f7a8fbbc68d')

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
