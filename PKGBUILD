# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=lightcraft-bin
_pkgname=${pkgname%-bin}
pkgver=0.20.0
pkgrel=1
pkgdesc='Photo library and non-destructive raw development (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url="https://github.com/storytold/$_pkgname"
license=('MIT OR Apache-2.0' 'OFL-1.1' 'LicenseRef-ArtCraft-brand')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme' 'libxkbcommon' 'libxkbcommon-x11'
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
sha256sums=('3f441009b57339b31404e8b56ea4e2d32b74a0c1c9aa0276b947c8f1452adc09'
            'd516dfeae4a19d636c0d16f389d0a8593efd9dd259b8832bb06722a3dc09e0ce'
            '6426c23f529938deddfbaed543e7135e08b514fa6a75b330734331d877c78faf'
            '262481e844521b326f5ecd053e59b98c8b2da78c8ee1bdbb6e8174305e54935a')
sha256sums_x86_64=('8cb5eed825b2dd9e0fa42680129d3e5aa718f07196d67cc5d05741f0e6a9cc25')
sha256sums_aarch64=('92d39ff4eb207e41dafe4bb1edc5708a048672b2a92500a840bee7869d504f85')

package() {
  cd "$srcdir/$_pkgname-$pkgver-linux-$CARCH"

  install -dm755 "$pkgdir/usr"
  cp -a bin share "$pkgdir/usr/"
  install -Dm644 share/doc/$_pkgname/LICENSE-* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir"/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
