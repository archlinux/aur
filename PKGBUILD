# Maintainer: Songtronix <contact@songtronix.com>
pkgname=airshipper
pkgver=0.2.0
pkgrel=1
pkgdesc="The official launcher for Veloren - an open-world, open-source multiplayer voxel RPG"
arch=('x86_64' 'i686')
url='https://www.songtronix.com/'
license=('GPL3')
depends=('openssl' 'libxcb' 'fontconfig')
makedepends=('git' 'rustup')
provides=()
conflicts=("$pkgname-git")
source=(
    "https://www.songtronix.com/download/airshipper-${pkgver}.tar.xz"
    'airshipper.desktop'
    'veloren.png'
)
noextract=('airshipper.desktop' 'veloren.png')
sha512sums=('85b050aa2a4e01845079e356eee8905ce0077ad029d3e19cb545282a39016bda8c8ad88e90a19cb9515b735e08a7c6b39bcfa90271a5c4fa6a51fb1291ca8ebf'
            '933512b8d5cb2245bfadd195aa75ace92966e91ef15dbbae97516ec76849e8c2b01236f8979f0164a3725a86c30c4ea2cbf17b06df91789ec1aa26445dedbfcb'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94')
prepare() {
    # Remove version from binary name
    mv "$srcdir/airshipper-$pkgver" "$srcdir/$pkgname"
}
package() {
    install -D "$srcdir/airshipper" -t "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/airshipper/assets"
    cp -r "$srcdir/assets" "$pkgdir/usr/share/airshipper/"
    install -Dm 644 "$srcdir/veloren.png" -t "$pkgdir/usr/share/pixmaps/"
    install -D "$srcdir/airshipper.desktop" -t "$pkgdir/usr/share/applications"
}
