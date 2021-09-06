# Maintainer: Marc Plano-Lesay <kernald@enoent.fr>
# Based on android-sdk-build-tools by xgdgsc and mynacol

_major=31
_ver=$_major.0.0
pkgname=android-sdk-build-tools-$_ver
pkgver=r$_ver
pkgrel=1
pkgdesc='Build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc)'
arch=('i686' 'x86_64')
url="https://developer.android.com/studio/releases/build-tools"
license=('custom')
depends=('gcc-libs' 'zlib')
optdepends=('lib32-gcc-libs' 'lib32-zlib')

source=("https://dl-ssl.google.com/android/repository/build-tools_r$_major-linux.zip")
sha256sums=('f90c22f5562638a2e00762e1711eebd55e7f0a05232b65200d387307d057bfe8')
options=('!strip')

_sdk=android-sdk
_android=android-12

package() {
  cd "$pkgdir"

  install -Dm644 "${srcdir}/$_android/NOTICE.txt" usr/share/licenses/$pkgname/NOTICE.txt

  target="opt/$_sdk/build-tools/$_ver"
  mkdir -p "$target"
  cp -r "$srcdir/$_android/"* "$target"
  chmod +Xr -R "$target"
}
