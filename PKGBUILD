# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=effectcraft-bin
_pkgname=${pkgname%-bin}
pkgver=0.14.0
pkgrel=1
pkgdesc='Motion graphics and visual effects compositor (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url="https://github.com/storytold/$_pkgname"
license=('MIT OR Apache-2.0' 'OFL-1.1' 'LicenseRef-ArtCraft-brand')
depends=('glibc' 'gcc-libs' 'libxkbcommon' 'libxkbcommon-x11'
         'libx11' 'libxcursor' 'libxi' 'libxrandr' 'wayland'
         'libglvnd' 'vulkan-icd-loader' 'dbus' 'alsa-lib')
optdepends=('vulkan-driver: hardware-accelerated Vulkan rendering'
            'xdg-desktop-portal: native file dialogs'
            'xdg-utils: open external links')
options=(!strip)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

source=("$_pkgname-$pkgver-NOTICE.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/NOTICE"
        "$_pkgname-$pkgver-LICENSE-brand.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/docs/brand/LICENSE-brand.txt"
        "$_pkgname-$pkgver-LICENSE-app-icon.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/app-icon/LICENSE.txt"
        "$_pkgname-$pkgver-OFL-Inter.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-Inter.txt"
        "$_pkgname-$pkgver-OFL-JetBrainsMono.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-JetBrainsMono.txt"
        "$_pkgname-$pkgver-OFL-NotoSerif.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-NotoSerif.txt")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums=('b58d5fdf0f7f90236118eb81903f765a4644eea9d3ac7eeaa552732d1b337111'
            '7ee27fdb49f96a969ab80d5f800d8422aa17cb39d1cca286d18aa6227d8c7628'
            '6f7a100b47da67df0c9e8e06397a7222766932c36cdebeff2e89cb2cd2917b85'
            '262481e844521b326f5ecd053e59b98c8b2da78c8ee1bdbb6e8174305e54935a'
            'a76abf002c49097d146e86740a3105a5d00450b1592e820a1109a8c5680cd697'
            'cee9892f9f0cc8fe882c9e9537ee6a89621d86ee7ceaf70b02e2b2b1c25c061a')
sha256sums_x86_64=('7f464e4cedcda418f8b84063c5b3a79bdf59a8a6c0a4e229bf7aaaf052a5d9a7')
sha256sums_aarch64=('000938d39fe2e9f9f68b3adc61fed537f004ff5defb68e82a9c3c5b2c7f8714d')

package() {
  cd "$srcdir/$_pkgname-$pkgver-linux-$CARCH"

  install -dm755 "$pkgdir/usr"
  cp -a bin share "$pkgdir/usr/"
  install -Dm644 share/doc/$_pkgname/LICENSE-* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir"/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
