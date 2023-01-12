# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Andrius Lukosevicius <niobium93@gmail.com>
# Contributor: giantdwarf <17hoehbr@gmail.com>

pkgname=dxvk-async-bin
pkgver=2.0
pkgrel=1
pkgdesc="A Vulkan-based compatibility layer for Direct3D 9/10/11 (with async patches)"
arch=('x86_64')
url="https://github.com/Sporif/dxvk-async"
license=('ZLIB' 'custom:libpng')
depends=('vulkan-icd-loader' 'wine>=4.0rc1' 'lib32-vulkan-icd-loader' 'bash')
provides=('dxvk' 'd9vk' "dxvk=$pkgver")
conflicts=('d9vk-mingw-git' 'd9vk-bin' 'd9vk-winelib-git' 'dxvk-bin' 'dxvk-git' 'dxvk-wine32-git' 'dxvk-wine64-git' 'dxvk-win32-git' 'dxvk-win64-git' 'dxvk-winelib-git' 'dxvk-mingw-git' 'dxvk-async' 'dxvk-async-git')
options=(!strip !buildflags staticlibs)
source=("$url/releases/download/$pkgver/dxvk-async-$pkgver.tar.gz"
        'https://raw.githubusercontent.com/doitsujin/dxvk/master/LICENSE'
        'dxvk-async-env.conf'
        'setup_dxvk.sh')
sha256sums=('f8e250f1afd1475e90b1dcc4083ae28a1174f0900e02f52955b6525996de5e2e'
            '03ca4af84f5cd28cef3ed3f1ef4d17996992d35ccdbe82b29cc020ca02c16f3d'
            '5ea0fbf7fddb45a8575ff001793011a594d999aaeb66ef95378bca950c844300'
            '0f688815530ab5e8cc89b9b45d9b1d66cd8cd5a7770fb8249339af555a30dfe7')

package() {
  cd "${pkgname%-bin}-$pkgver"

  mkdir -p -m 755 "$pkgdir/usr/share"
  cp -dr --preserve=mode,timestamp . "$pkgdir/usr/share/dxvk"

  mkdir -p -m 755 "$pkgdir/usr/share/licenses/dxvk-async"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/dxvk-async/LICENSE"

  install -Dm 755 "$srcdir/setup_dxvk.sh" "$pkgdir/usr/share/dxvk/setup_dxvk.sh"
  mkdir -p -m 755 "$pkgdir/usr/bin"
  ln -s /usr/share/dxvk/setup_dxvk.sh "$pkgdir/usr/bin/setup_dxvk"

  mkdir -p -m 755 "$pkgdir/etc/environment.d"
  install -Dm644 "$srcdir/dxvk-async-env.conf" "$pkgdir/etc/environment.d/dxvk-async-env.conf"
}
