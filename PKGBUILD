# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=vectorcraft-bin
_pkgname=${pkgname%-bin}
pkgver=0.8.0
pkgrel=1
pkgdesc='Vector illustration and graphics editor (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url="https://github.com/storytold/$_pkgname"
license=('MIT OR Apache-2.0' 'OFL-1.1' 'LicenseRef-ArtCraft-brand' 'ISC')
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
        "$_pkgname-$pkgver-OFL-Inter.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-Inter.txt"
        "$_pkgname-$pkgver-OFL-JetBrainsMono.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-JetBrainsMono.txt"
        "$_pkgname-$pkgver-OFL-SourceSans3.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-SourceSans3.txt"
        "$_pkgname-$pkgver-OFL-SourceSerif4.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/fonts/OFL-SourceSerif4.txt"
        "$_pkgname-$pkgver-LICENSE-lucide.txt::https://raw.githubusercontent.com/storytold/$_pkgname/v$pkgver/assets/icons/LICENSE-lucide.txt")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
sha256sums=('6f7d5ee568de2b9f269af2ca4de11230eaaf1d16d3e6e817a13a17e5a669035f'
            '197b20a10ffd9474e63c08893440abb7724a410c975829d809390f2ce21fac1e'
            '7323e2ad58efcf69f0871f419531f707ae6bee61d00c7d84de6f8300d7ad19f7'
            '262481e844521b326f5ecd053e59b98c8b2da78c8ee1bdbb6e8174305e54935a'
            'a76abf002c49097d146e86740a3105a5d00450b1592e820a1109a8c5680cd697'
            '56af9b9c6715597e458284a474dc118a50a4150e9d547c70f7b4a33c3e6a9328'
            'c21d7293d87b6d7ab1d0229a2f55b77f33a7613a6a4e66f6693d68d7d8d09464'
            'b495047bd93a9b06913511076f504daba17d5bbeb3e0650f3bb53a4220329c57')
sha256sums_x86_64=('48b8e671a415f5dde912a049f82cda05b66f7e6fd79a81b458816ff9186882cf')
sha256sums_aarch64=('1ab4ed89ebefb7c386db0374df330097f88e69feaf3fa8fbb30c99d2fc8fe5a9')

package() {
  cd "$srcdir/$_pkgname-$pkgver-linux-$CARCH"

  install -dm755 "$pkgdir/usr"
  cp -a bin share "$pkgdir/usr/"
  install -Dm644 share/doc/$_pkgname/LICENSE-* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir"/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
