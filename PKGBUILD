# Maintainer: Marc Plano-Lesay <kernald@enoent.fr>
# Based on android-sdk-build-tools by xgdgsc and mynacol

_ver=30.0.1
pkgname=android-sdk-build-tools-$_ver
pkgver=r$_ver
pkgrel=3
pkgdesc='Build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc)'
arch=('i686' 'x86_64')
url="https://developer.android.com/studio/releases/build-tools"
license=('custom')
depends=('gcc-libs' 'zlib')
optdepends=('lib32-gcc-libs' 'lib32-zlib')

source=("https://dl-ssl.google.com/android/repository/build-tools_${pkgver}-linux.zip")
sha256sums=('560eace2cc6ca16011fbb97c92c39aa0441d54dbfc13837dfbdb4a6bdf9c9da8')
options=('!strip')

_sdk=android-sdk
_android=android-11

package() {
  cd "$pkgdir"

  install -Dm644 "${srcdir}/$_android/NOTICE.txt" usr/share/licenses/$pkgname/NOTICE.txt

  target="opt/$_sdk/build-tools/$_ver"
  mkdir -p "$target"
  cp -r "$srcdir/$_android/"* "$target"
  chmod +Xr -R "$target"
}
