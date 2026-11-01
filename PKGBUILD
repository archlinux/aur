# Maintainer: Pavel Pavlov <pakx86 at gmail dot com>

pkgname=lapac71g-lapac71h-keyboard-gnome-git
pkgver=r84.72d5706
pkgrel=1
pkgdesc='GNOME Quick Settings keyboard RGB control for Intel NUC X15 LAPAC71G/LAPAC71H'
arch=('any')
url='https://github.com/PaveLiArcH/qc71_laptop'
license=('GPL-2.0-only')
depends=('python-gobject' 'gtk4>=4.10' 'libadwaita>=1.5' 'polkit'
         'gnome-shell>=1:51')
makedepends=('git')
optdepends=('qc71-laptop-lapac71-dkms-git: LAPAC71G/H keyboard LED driver')
provides=('lapac71g-lapac71h-keyboard-gnome' 'qc71-keyboard-gnome')
conflicts=('lapac71g-lapac71h-keyboard-gnome' 'qc71-keyboard-gnome')
options=('!debug')
source=('qc71_laptop::git+https://github.com/PaveLiArcH/qc71_laptop.git#branch=master')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/qc71_laptop"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/qc71_laptop"
    make -C contrib/gnome install DESTDIR="${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 contrib/gnome/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
