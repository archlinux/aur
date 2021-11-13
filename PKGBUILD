pkgname=android-ndk-21
pkgver=r21.e
pkgrel=1
pkgdesc='Android C/C++ developer kit'
arch=('x86_64')
url='https://developer.android.com/ndk/'
license=('GPL' 'LGPL' 'custom')
options=('!strip' 'staticlibs')
backup=("etc/profile.d/$pkgname.sh")
install="$pkgname.install"
replaces=('android-ndk64')
depends=('glibc')
optdepends=(
  'ncurses5-compat-libs: for using gdb'
  'python2: various helper scripts'
  'python: various helper scripts'
)
source=("$pkgname.sh")
source_x86_64=("https://dl.google.com/android/repository/${pkgname/-r21/}-${pkgver/./}-linux-x86_64.zip")
# SHA1 sums is kept to follow upstream releases https://github.com/android-ndk/ndk/issues/673
sha1sums=('2479a8d74428eb651ad2b9772ad655d7a90af410')
sha1sums_x86_64=('c3ebc83c96a4d7f539bd72c241b2be9dcd29bda9')
sha256sums=('2068618bc3e99149310f544be5d639ae183dc767d5a7157a07d8e024417b6017')
sha256sums_x86_64=('ad7ce5467e18d40050dc51b8e7affc3e635c85bd8c59be62de32352328ed467e')

package() {
  install -Ddm755 "$pkgdir/opt"
  mv "$pkgname-${pkgver/./}" "$pkgdir/opt/$pkgname"

  install -Dm644 $pkgname.sh -t "$pkgdir/etc/profile.d/"

  # make sdkmanager and gradle recognize NDK
  install -Ddm755 "$pkgdir"/opt/android-sdk
  ln -s /opt/$pkgname "$pkgdir"/opt/android-sdk/ndk-bundle
}
