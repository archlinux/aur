# Maintainer: max.bra <max dot bra dot gtalk at gmail dot com>

pkgname=desktopfolder
pkgver=1.1.3
pkgrel=2
pkgdesc='Organize your desktop with panels that hold your things.'
arch=('i686' 'x86_64')
url='https://github.com/spheras/desktopfolder'
license=('GPL3')
depends=('libwnck3' 'gtksourceview3' 'libgee')
makedepends=('meson' 'ninja' 'vala' 'intltool')
source=("https://github.com/spheras/${pkgname}/archive/v${pkgver}.zip"
        mason.patch::"https://github.com/spheras/${pkgname}/commit/a340264fce3d0a0576db559e159415c4713de753.patch")

sha256sums=('6d03839c8e890d11817e253b48d59c6d31bf09a0a0e6f698e7b98f7fe810ce8c'
            'fc6058f0a935079552c5508e75786556f812c5855a2f4b792d4881c68c13e48a')

prepare() {
    cd "$srcdir"/"$pkgname"-"$pkgver"
    patch -Np1 -i "$srcdir"/mason.patch
}

build() {
    cd ${pkgname}-${pkgver}
    meson build --prefix=/usr
    cd build
    meson configure -D prefix=/usr
    ninja
}

package() {
    cd ${pkgname}-${pkgver}
    DESTDIR="${pkgdir}" ninja -C build install
}
