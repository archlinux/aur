# Maintainer: Adrià Cereto i Massagué <ssorgatem@gmail.com>
# Co-Maintainer: Jonas Van der Aa <ketsukonn@gmail.com>

pkgbase=dxvk-bin
pkgname=('dxvk-bin')
pkgver=2.4.1
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
sha256sums=('7b23db4e1386b5d9a3ec0d83daa8b06096b758639185c11a673373a5ae478d54'
'778ec44acc09ac9c718354c9a96776b60bd4156dacf584e5c29b2c9697c76684')

package_dxvk-bin () {
        depends=('vulkan-icd-loader')
        optdepends=('lib32-vulkan-icd-loader: 32-bit Windows application support')
        install -D "dxvk-$pkgver"/x32/* -t "$pkgdir/usr/share/dxvk/x32"
        install -D "dxvk-$pkgver"/x64/* -t "$pkgdir/usr/share/dxvk/x64"
        install setup_dxvk.sh -t "$pkgdir/usr/share/dxvk/"
        install -d "$pkgdir/usr/bin"
        ln -s /usr/share/dxvk/setup_dxvk.sh "$pkgdir/usr/bin/setup_dxvk"
}
