# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=lightcraft-bin
_pkgname=${pkgname%-bin}
pkgver=0.2.1
pkgrel=1
pkgdesc='Photo library and non-destructive raw development (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url="https://github.com/storytold/$_pkgname"
license=('MIT OR Apache-2.0' 'OFL-1.1' 'LicenseRef-ArtCraft-brand')
depends=('glibc' 'gcc-libs' 'libxkbcommon' 'libxkbcommon-x11'
         'libx11' 'libxcursor' 'libxi' 'libxrandr' 'wayland'
         'libglvnd' 'vulkan-icd-loader' 'dbus')
optdepends=('vulkan-driver: hardware-accelerated Vulkan rendering'
            'xdg-desktop-portal: native file dialogs'
            'xdg-utils: open external links')
options=(!strip)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

source=("$_pkgname-$pkgver-NOTICE.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/NOTICE"
        "$_pkgname-$pkgver-LICENSE-brand.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/docs/brand/LICENSE-brand.txt"
        "$_pkgname-$pkgver-LICENSE-app-icon.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/app-icon/LICENSE.txt"
        "$_pkgname-$pkgver-OFL-Inter.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-Inter.txt")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums=('bf18e13bc1b7d546314a370cb35a99007a62841f9b733bb919665ed55eb72e4a'
            'd516dfeae4a19d636c0d16f389d0a8593efd9dd259b8832bb06722a3dc09e0ce'
            '6426c23f529938deddfbaed543e7135e08b514fa6a75b330734331d877c78faf'
            '262481e844521b326f5ecd053e59b98c8b2da78c8ee1bdbb6e8174305e54935a')
sha256sums_x86_64=('543f91c96e4081e86065ec8fb3d62447b08bfd6ae0da22df50fc27a55bb9777d')
sha256sums_aarch64=('57c0c2504de55a8bc6a0c9611a030272abd8e254b255e12f89114ed6bc16c69e')

package() {
  cd "$srcdir/$_pkgname-$pkgver-linux-$CARCH"

  install -dm755 "$pkgdir/usr"
  cp -a bin share "$pkgdir/usr/"
  install -Dm644 share/doc/$_pkgname/LICENSE-* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir"/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
