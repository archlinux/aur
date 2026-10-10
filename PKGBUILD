# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=lightcraft-bin
_pkgname=${pkgname%-bin}
pkgver=0.5.0
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
sha256sums=('3b9149a422812669a6a6b03ef2bdee1b1e8a0cbd308fe18b44701955c390cd83'
            'd516dfeae4a19d636c0d16f389d0a8593efd9dd259b8832bb06722a3dc09e0ce'
            '6426c23f529938deddfbaed543e7135e08b514fa6a75b330734331d877c78faf'
            '262481e844521b326f5ecd053e59b98c8b2da78c8ee1bdbb6e8174305e54935a')
sha256sums_x86_64=('164170bb3745b94cffc1e05d59b20778eb51698558224f846e9e1f5424da3265')
sha256sums_aarch64=('1ae4a65f31e5338d06387e29c0c1c3d8d4b597e72e58c759e0190347a9a208cd')

package() {
  cd "$srcdir/$_pkgname-$pkgver-linux-$CARCH"

  install -dm755 "$pkgdir/usr"
  cp -a bin share "$pkgdir/usr/"
  install -Dm644 share/doc/$_pkgname/LICENSE-* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir"/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
