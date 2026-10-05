# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=printcraft-bin
_pkgname=${pkgname%-bin}
pkgver=0.2.0
pkgrel=1
pkgdesc='PDF viewer and editor (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url="https://github.com/storytold/$_pkgname"
license=('MIT OR Apache-2.0' 'OFL-1.1' 'LicenseRef-ArtCraft-brand' 'ISC' 'BSD-3-Clause')
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
        "$_pkgname-$pkgver-OFL-DancingScript.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-DancingScript.txt"
        "$_pkgname-$pkgver-OFL-Inter.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-Inter.txt"
        "$_pkgname-$pkgver-OFL-JetBrainsMono.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-JetBrainsMono.txt"
        "$_pkgname-$pkgver-LICENSE-lucide.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/icons/LICENSE-lucide.txt"
        "$_pkgname-$pkgver-LICENSE-FOXIT.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/vendor/hayro-interpret/assets/LICENSE_FOXIT")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums=('ea1edc629f3a66291c05f2c5859ae243c462c7b5315a5b188a97a84beb519b5b'
            'c5424ea8916be3a970053f5ec5761e225d57a6c09ea57c3a67d2c39b67a870b6'
            '22a8bacc20accfdca66dfec9bcebbc062c998e994f860d6f9bdd396d8e48ff74'
            '6f090277c00af96651ce6dbcc38ff1591047a3bffef486e80b6a32e8276a8201'
            '262481e844521b326f5ecd053e59b98c8b2da78c8ee1bdbb6e8174305e54935a'
            'a76abf002c49097d146e86740a3105a5d00450b1592e820a1109a8c5680cd697'
            'b495047bd93a9b06913511076f504daba17d5bbeb3e0650f3bb53a4220329c57'
            'b578cdd2345840ada550bd12519533812320d5f1d21cf4c1c7e1b1b0a31c98b7')
sha256sums_x86_64=('50ad54b7efbce70af3e1fcc23e728204201df9e33a95e35d4f2d4397801992d3')
sha256sums_aarch64=('75ea79c5be0942ae5de7e95018673580ba6fcafe8ba73c5df4761e16db6d9e4a')

package() {
  cd "$srcdir/$_pkgname-$pkgver-linux-$CARCH"

  install -dm755 "$pkgdir/usr"
  cp -a bin share "$pkgdir/usr/"
  install -Dm644 share/doc/$_pkgname/LICENSE-* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir"/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
