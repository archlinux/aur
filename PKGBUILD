# Maintainer: Peter Jung <ptr1337@cachyos.org>

pkgname=occt
pkgver=14.0.8
pkgrel=1
pkgdesc="OverClock Checking Tool - CPU/GPU stress testing and monitoring (binary)"
arch=('x86_64')
url="https://www.ocbase.com/"
license=('LicenseRef-Proprietary')
depends=(
  glibc
  gcc-libs
  zlib
)
options=(!strip !debug)
source=(
  "occt-${pkgver}::https://dl.ocbase.com/linux/per/stable/OCCT"
  "occt.desktop"
  "occt.png"
  "eula.txt"
)
b2sums=('d6331cf2bd186f0a3a3d77148e1015cb87d37c5012875df12f6b7ae78ac44e6066b68816b15b27f611ca3f2eb7ee471a48d83b0e416d02ff9a5cb2598d2bac2b'
        '20027853572302a9c4ac95b81c52364ffdbe925515d69caa8d08063e7872dc54449e6ca2938b68a41a6047475637ea0a2b1cb6743d03738b97b38d4caa617b37'
        'ffef968846e3e4b3a585c2a1e85438cfe2c885d618bcb6c1f18e687b747637458d8faaee10debbb7401e1880fd56d6f8835eeced1d393ee8443abe8664f09afc'
        'c27bfa10944aa8f945f890a351de0e0bd2ceb17f84494ddcb99be94ed173bd48388c537c8908b3b5ea8606a2778aab6c075b7575ab4ef389cf68cb1a7c74f3b0')

prepare() {
  # Make the downloaded binary executable
  chmod +x "occt-${pkgver}"
}

package() {
  cd "$srcdir"

  install -Dm755 "occt-${pkgver}" "$pkgdir/opt/$pkgname/$pkgname"
  # Disable automatic updates in future release
  touch "$pkgdir/opt/$pkgname/disable_update"

  # Use configs in home dir
  touch "$pkgdir/opt/occt/app_folder_in_home"

  # Add symlink for easier execution and detection
  install -d "$pkgdir/usr/bin"
  ln -s /opt/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname" 
  
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  install -Dm644 "eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
