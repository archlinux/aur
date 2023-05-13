# Maintainer: Adrià Cereto i Massagué <ssorgatem@gmail.com>
# Co-Maintainer: Jonas Van der Aa <ketsukonn@gmail.com>

pkgbase=dxvk-bin
pkgname=('dxvk-bin')
pkgver=2.2
pkgrel=1
pkgdesc="A Vulkan-based compatibility layer for Direct3D 9/10/11 which allows running 3D applications on Linux using Wine (Windows DLL binary files)"
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
arch=('x86_64')
provides=("dxvk" "d9vk" "dxvk=$pkgver")
conflicts=("dxvk" "d9vk")
options=(!strip)
source=("https://github.com/doitsujin/dxvk/releases/download/v$pkgver/dxvk-$pkgver.tar.gz"
"setup_dxvk.sh"
)
sha256sums=('fcbede6da370d138f275ca05bc887f5a562f27cd8bd00f436706a7142cb51630'
'0f688815530ab5e8cc89b9b45d9b1d66cd8cd5a7770fb8249339af555a30dfe7')

package_dxvk-bin () {
        depends=('vulkan-icd-loader')
        optdepends=('lib32-vulkan-icd-loader: 32-bit Windows application support')
        install -D "dxvk-$pkgver"/x32/* -t "$pkgdir/usr/share/dxvk/x32"
        install -D "dxvk-$pkgver"/x64/* -t "$pkgdir/usr/share/dxvk/x64"
        install setup_dxvk.sh -t "$pkgdir/usr/share/dxvk/"
        install -d "$pkgdir/usr/bin"
        ln -s /usr/share/dxvk/setup_dxvk.sh "$pkgdir/usr/bin/setup_dxvk"
}
