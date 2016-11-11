# Maintainer: farwayer <farwayer@gmail.com>

_ver=23.0.3
_sdk=android-sdk
_android=android-6.0

pkgname=android-sdk-build-tools-$_ver
pkgver=r$_ver
pkgrel=1
pkgdesc='Build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc)'
arch=('i686' 'x86_64')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('gcc-libs' 'zlib')
optdepends=()
provides=("android-sdk-build-tools=$pkgver")

if [[ $CARCH = x86_64 ]]; then
  depends=('lib32-gcc-libs' 'lib32-zlib')
fi

source=("https://dl-ssl.google.com/android/repository/build-tools_${pkgver}-linux.zip")
sha1sums=('368f2600feac7e9b511b82f53d1f2240ae4a91a3')
options=('!strip')

package() {
  cd "$pkgdir"
  install -Dm644 "${srcdir}/$_android/NOTICE.txt" usr/share/licenses/$pkgname/NOTICE.txt
  mkdir -p opt/$_sdk/build-tools/$_ver
  cp -r "$srcdir/$_android/"* "$pkgdir/opt/$_sdk/build-tools/$_ver"
  chmod +Xr -R "$pkgdir/opt/$_sdk/build-tools/$_ver"
}
