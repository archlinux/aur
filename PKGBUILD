# Maintainer: Marc Vidal <mvidaldp@gmail.com>
# Forked from: https://github.com/archlinux/svntogit-community/tree/packages/grub-customizer/trunk

pkgname=manjaro-grub-customizer
_pkgname=grub-customizer
pkgver=5.1.0
_pkgver=v5.1.0
pkgrel=2
pkgdesc="A graphical interface to configure the GRUB2/BURG settings and menuentries"
url="https://github.com/mvidaldp/manjaro-grub-customizer"
arch=('x86_64')
license=('GPL3')
depends=('grub' 'gtkmm3' 'libarchive')
optdepends=('hwinfo: Additional hardware information'
    'polkit: Run grub-customizer from menu')
makedepends=('cmake')
provides=($pkgname)
conflicts=($_pkgname)
backup=('etc/grub-customizer/grub.cfg')
source=("https://github.com/mvidaldp/${pkgname}/releases/download/${_pkgver}/${pkgname}_${pkgver}.tar.gz"
    'grub.cfg')
sha512sums=('d79c7996afd8486483d4460432207dc19315d7377dcfd2fd6a4594e64c6750bbae36f96c395c4a9748d0ff43c6095399d822fc6a23beedbc8769802818dfa11f'
    '40156b6546a4d7e8abbef2ab3dece0481a4a2ca276b9a15c5a7bf7e3b11004335b6a747be391b5c1accb35c9e9e3bc628e571cd245e5f2980e5ecd6a3ceb24f5')

prepare() {
    cd "${_pkgname}-${pkgver}" || exit
    mkdir -p build
}

build() {
    cd "${_pkgname}-${pkgver}/build" || exit
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${_pkgname}-${pkgver}/build" || exit
    make install DESTDIR="${pkgdir}"
    # configuration
    install -vDm 644 "${srcdir}/grub.cfg" -t "${pkgdir}/etc/${_pkgname}/"
    # additional documentation
    install -vDm 644 ../{changelog,README} \
        -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
# vim:set ts=2 sw=2 et:
