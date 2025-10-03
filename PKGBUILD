# Maintainer: Voxan24 <admin@hessfr.fr>

pkgname=android-ndk-beta
_pkgname=${pkgname/-beta*/}
pkgver=r29_beta4
pkgrel=1
pkgdesc='Android C/C++ developer kit (beta)'
arch=('x86_64')
url='https://developer.android.com/ndk/'
license=('GPL' 'LGPL' 'custom')
options=('!strip' 'staticlibs')
backup=("etc/profile.d/$pkgname.sh")
install="$pkgname.install"
depends=('bash' 'glibc' 'gcc-libs' 'zlib')
optdepends=(
  'ncurses5-compat-libs: for curses module in bundled Python'
  'bzip2: for bz2 module in bundled Python'
  'libxcrypt-compat: for crypt module in bundled Python'
  'python: various helper scripts'
  'perl: various helper scripts'
  'libc++: for some LLVM components'
)
provides=('android-ndk')
source=("$pkgname-$pkgver.zip"::"https://dl.google.com/android/repository/${_pkgname}-${pkgver/_/-}-linux.zip"
        "$pkgname.sh")
# SHA1 sums is kept to follow upstream releases https://github.com/android-ndk/ndk/issues/673
sha1sums=('ecba553458e222a7c9b24945a3690e80a4730104'
          'b0a3c3d4e148c1049f9c8b12f2632840630ea4db')
sha256sums=('c5db6031a549b5274eed920c45ee3c7da1ac3f1f416cbb512dd9d88417bdf009'
            'a39422d48174302e1ee27f07031f20adc78224d12c17a5451129a88b47c901c1')

package() {
  install -Ddm755 "$pkgdir/opt"
  mv "$_pkgname-${pkgver/_/-}" "$pkgdir/opt/$pkgname"

  install -Dm644 $pkgname.sh -t "$pkgdir/etc/profile.d/"

  # XXX: not creating a symlink at /opt/android-sdk/ndk-bundle as the latter is already used by android-ndk
}
