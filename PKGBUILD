# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=effectcraft-bin
_pkgname=${pkgname%-bin}
pkgver=0.18.0
pkgrel=1
pkgdesc='Motion graphics and visual effects compositor (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url="https://github.com/storytold/$_pkgname"
license=('MIT OR Apache-2.0' 'OFL-1.1' 'LicenseRef-ArtCraft-brand')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme' 'libxkbcommon' 'libxkbcommon-x11'
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
sha256sums=('c7ecb79db5a35e749c037773c9867d07f6ff598edce3d72bd443b4d00f24e0be'
            '7ee27fdb49f96a969ab80d5f800d8422aa17cb39d1cca286d18aa6227d8c7628'
            '6f7a100b47da67df0c9e8e06397a7222766932c36cdebeff2e89cb2cd2917b85'
            '262481e844521b326f5ecd053e59b98c8b2da78c8ee1bdbb6e8174305e54935a'
            'a76abf002c49097d146e86740a3105a5d00450b1592e820a1109a8c5680cd697'
            'cee9892f9f0cc8fe882c9e9537ee6a89621d86ee7ceaf70b02e2b2b1c25c061a')
sha256sums_x86_64=('94d1d85691d54ba57fa86e04872fbcc426c33d1bd364f1fc976b1f607344880b')
sha256sums_aarch64=('16afef1cf2e8ff1e48712f462f7f9732696d81f7f81978c0a7ac0f7c092aa5a8')

package() {
  cd "$srcdir/$_pkgname-$pkgver-linux-$CARCH"

  install -dm755 "$pkgdir/usr"
  cp -a bin share "$pkgdir/usr/"
  install -Dm644 share/doc/$_pkgname/LICENSE-* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir"/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
