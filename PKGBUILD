# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: Andrius Lukosevicius <niobium93@gmail.com>
# Contributor: giantdwarf <17hoehbr@gmail.com>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>

pkgname=dxvk-gplasync-bin
pkgver=2.3
pkgrel=1
pkgdesc="A Vulkan-based compatibility layer for Direct3D 9/10/11 (with gplasync patches)"
arch=('x86_64')
url="https://gitlab.com/Ph42oN/dxvk-gplasync"
license=('ZLIB' 'custom:libpng')
depends=('vulkan-icd-loader' 'wine>=4.0rc1' 'lib32-vulkan-icd-loader' 'bash')
provides=('dxvk' 'd9vk' "dxvk=$pkgver")
conflicts=('dxvk' 'd9vk')
options=(!strip !buildflags staticlibs)
source=("$url/-/raw/main/releases/dxvk-gplasync-v$pkgver-$pkgrel.tar.gz"
        'https://raw.githubusercontent.com/doitsujin/dxvk/master/LICENSE'
        'dxvk-gplasync-env.conf'
        setup_dxvk{,_proton}.sh)
sha256sums=('1e1f6db95f4a7f02d372012f4a723a161d732a39b3b3efcf8159e03cdff2dc1e'
            '03ca4af84f5cd28cef3ed3f1ef4d17996992d35ccdbe82b29cc020ca02c16f3d'
            '2bce3bf5dc5a3c7312bbaae96daf82e0fe6c370e96017ce5a0c49f40901866e3'
            '0f688815530ab5e8cc89b9b45d9b1d66cd8cd5a7770fb8249339af555a30dfe7'
            '64fbbf9f30f2f4e8d1d82b088ade92f1bf8817a4bf6e21d7dd978f4276abe1a6')

package() {
  cd "dxvk-gplasync-v$pkgver-$pkgrel" || exit 1

  install -dm755 "$pkgdir/usr/share"
  cp -dr --preserve=mode,timestamp . "$pkgdir/usr/share/dxvk"

  install -dm755 "$pkgdir/usr/share/licenses/dxvk-gplasync"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/dxvk-gplasync/LICENSE"

  install -Dm 755 "$srcdir/setup_dxvk.sh" "$pkgdir/usr/share/dxvk/setup_dxvk.sh"
  install -Dm 755 "$srcdir/setup_dxvk_proton.sh" "$pkgdir/usr/share/dxvk/setup_dxvk_proton.sh"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/share/dxvk/setup_dxvk.sh "$pkgdir/usr/bin/setup_dxvk"
  ln -s /usr/share/dxvk/setup_dxvk_proton.sh "$pkgdir/usr/bin/setup_dxvk_proton"

  install -dm755 "$pkgdir/etc/environment.d"
  install -Dm644 "$srcdir/dxvk-gplasync-env.conf" "$pkgdir/etc/environment.d/dxvk-gplasync-env.conf"
}
