# Maintainer: Mckol <mckol363@gmail.com>
# Co-Maintainer: Songtronix <contact@songtronix.com>

pkgname=airshipper-git
pkgver=0.4.2.r0.ff875aa
pkgrel=1
pkgdesc="The official launcher for Veloren - an open-world, open-source multiplayer voxel RPG"
arch=('x86_64' 'i686')
url='https://www.songtronix.com/'
license=('GPL3')
depends=('openssl' 'libxcb' 'bzip2')
makedepends=('git' 'rustup')
provides=('airshipper')
conflicts=('airshipper')
source=(
    "$pkgname"::'git+https://github.com/songtronix/airshipper.git'
    'airshipper.desktop'
    'veloren.png'
)
noextract=('airshipper.desktop' 'veloren.png')
sha512sums=('SKIP'
            '76b8d61db797730837852ee8b8526532e0bcec0ed4a9d43ae7f93ebb4ad22afd4ea55445638e598f581b32e05dcd04a1435a774fd36345760cad8084a72560de'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//'
}

build() {
    cd "$srcdir/$pkgname"
    cargo build --release --bin airshipper
}

package() {
    install -D "$srcdir/$pkgname/target/release/airshipper" -t "$pkgdir/usr/bin/"
    install -Dm 644 "$srcdir/veloren.png" -t "$pkgdir/usr/share/pixmaps/"
    install -D "$srcdir/airshipper.desktop" -t "$pkgdir/usr/share/applications"
}
