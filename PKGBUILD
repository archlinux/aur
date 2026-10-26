# Maintainer: MeoArch <https://github.com/QwQdoge>
_srcdir=MeoSettings-e1bd8ea446c406eafba32abc357be1eae40a57a5
pkgname=meo-settings
pkgver=0.2.0beta5
pkgrel=5
pkgdesc="Meo Settings application for MeoArch"
arch=('x86_64')
url='https://github.com/QwQdoge/MeoSettings'
license=('GPL-3.0-or-later')
depends=('meo-account' 'meo-icon-studio>=0.1.0' 'meoui-qml>=1.0.4beta1' 'meo-kde-runtime>=0.4.0beta3-7'
         'qt6-declarative' 'qt6-svg' 'qt6-multimedia' 'kservice' 'libkscreen>=6.8' 'kconfig' 'kcoreaddons' 'ki18n' 'solid')
makedepends=('cmake' 'ninja' 'qt6-tools' 'extra-cmake-modules')
source=('MeoSettings-e1bd8ea446c406eafba32abc357be1eae40a57a5.tar.gz::https://codeload.github.com/QwQdoge/MeoSettings/tar.gz/e1bd8ea446c406eafba32abc357be1eae40a57a5')
sha256sums=('8b07b733537d3059e117eea12af0547645a71e9da409060922d63590318358cc')

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
