# Maintainer: Adrià Cereto i Massagué <ssorgatem@gmail.com>
# Co-Maintainer: Jonas Van der Aa <ketsukonn@gmail.com>

pkgbase=dxvk-bin
pkgname=('dxvk-bin')
pkgver=3.1.0
_githubver=3.1
pkgrel=1
pkgdesc="A Vulkan-based compatibility layer for Direct3D 9/10/11 which allows running 3D applications on Linux using Wine (Windows DLL binary files)"
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
arch=('x86_64')
provides=("dxvk" "d9vk" "dxvk=$pkgver")
conflicts=("dxvk" "d9vk")
options=(!strip)
source=("https://github.com/doitsujin/dxvk/releases/download/v$_githubver/dxvk-$_githubver.tar.gz"
"setup_dxvk.sh"
)
sha256sums=('30f9cc326874be344285582275446968cfa4c069db31ce56df312d6644179154'
            '2ca9ece1b6c36446e9f6955d3d03ab72b173c8f85539a2848febc51b38be705e')

package_dxvk-bin () {
        depends=('vulkan-icd-loader')
        optdepends=('lib32-vulkan-icd-loader: 32-bit Windows application support')
        install -D "dxvk-$_githubver"/x32/* -t "$pkgdir/usr/share/dxvk/x32"
        install -D "dxvk-$_githubver"/x64/* -t "$pkgdir/usr/share/dxvk/x64"
        install setup_dxvk.sh -t "$pkgdir/usr/share/dxvk/"
        install -d "$pkgdir/usr/bin"
        ln -s /usr/share/dxvk/setup_dxvk.sh "$pkgdir/usr/bin/setup_dxvk"
}
