# Maintainer: Dominic Meiser <git@msrd0.de>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: frownlee <florez.brownlee@gmail.com>

pkgname=android-ndk-25
pkgver=r25.c
pkgrel=1
pkgdesc='Android C/C++ developer kit'
arch=('x86_64')
url='https://developer.android.com/ndk/'
license=('GPL' 'LGPL' 'custom')
options=('!strip' 'staticlibs')
backup=("etc/profile.d/android-ndk.sh")
install="$pkgname.install"
conflicts=('android-ndk')
provides=("android-ndk=$pkgver")
replaces=('android-ndk64')
depends=('bash' 'glibc' 'gcc-libs' 'zlib')
makedepends=('bzip2' 'libxcrypt-compat' 'python' 'perl' 'libc++')
optdepends=(
  'ncurses5-compat-libs: for curses module in bundled Python'
  'bzip2: for bz2 module in bundled Python'
  'libxcrypt-compat: for crypt module in bundled Python'
  'python: various helper scripts'
  'perl: various helper scripts'
  'libc++: for some LLVM components'
)
source=("android-ndk.sh")
source_x86_64=("https://dl.google.com/android/repository/android-ndk-${pkgver/./}-linux.zip")
# SHA1 sums is kept to follow upstream releases https://github.com/android-ndk/ndk/issues/673
sha1sums=('38c46b7b1a1c54a0845d027a8eaf37ed0447d3b2')
sha1sums_x86_64=('53af80a1cce9144025b81c78c8cd556bff42bd0e')
sha256sums=('2050ff500443f6cfa4567c02248cb3ec6ccbc67ce81b32d8dda79383c5103db2')
sha256sums_x86_64=('769ee342ea75f80619d985c2da990c48b3d8eaf45f48783a2d48870d04b46108')

package() {
  install -Ddm755 "$pkgdir/opt"
  mv "android-ndk-${pkgver/./}" "$pkgdir/opt/android-ndk"

  install -Dm644 android-ndk.sh -t "$pkgdir/etc/profile.d/"

  # make sdkmanager and gradle recognize NDK
  install -Ddm755 "$pkgdir"/opt/android-sdk
  ln -s /opt/android-ndk "$pkgdir"/opt/android-sdk/ndk-bundle
}
