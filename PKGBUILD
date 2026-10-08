# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=photocraft-bin
_pkgname=${pkgname%-bin}
pkgver=0.3.0
pkgrel=1
pkgdesc='Layer-based image and photo editor (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url="https://github.com/storytold/$_pkgname"
license=('MIT OR Apache-2.0' 'OFL-1.1' 'LicenseRef-ArtCraft-brand' 'ISC' 'LicenseRef-SCOWL')
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
        "$_pkgname-$pkgver-LICENSE-SCOWL.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/dict/LICENSE-SCOWL.txt"
        "$_pkgname-$pkgver-OFL-Inter.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-Inter.txt"
        "$_pkgname-$pkgver-OFL-JetBrainsMono.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-JetBrainsMono.txt"
        "$_pkgname-$pkgver-LICENSE-lucide.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/icons/LICENSE-lucide.txt")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums=('fb7d6f0e57c396b6c94f6315d3dba13048a296d81e7546d33e2b7c77c71ea147'
            'f0a582a0645a2ec9c979ac2619e9503315483a33f1bb39b56fe5b55632b0ca79'
            'a5cf25f3f3c2fe2c6d294db04f1bfea7259ac21e8edde5c7fabaa4c379e94795'
            'e2a852424fe4ee684225a6a8a34c73f8944f11ad825b7fc3a58ddcee617ed23d'
            '262481e844521b326f5ecd053e59b98c8b2da78c8ee1bdbb6e8174305e54935a'
            'a76abf002c49097d146e86740a3105a5d00450b1592e820a1109a8c5680cd697'
            'b495047bd93a9b06913511076f504daba17d5bbeb3e0650f3bb53a4220329c57')
sha256sums_x86_64=('e8f3af6afae53a8a4d6eb13abfbccf74b8ffc2143e487047d724e5683d5cff3d')
sha256sums_aarch64=('ddcd697bf2f3ba26a9462b71624ec7fa866b8fdc5126cb3cfa9f8b164f35baff')

package() {
  cd "$srcdir/$_pkgname-$pkgver-linux-$CARCH"

  install -dm755 "$pkgdir/usr"
  cp -a bin share "$pkgdir/usr/"
  install -Dm644 share/doc/$_pkgname/LICENSE-* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir"/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
