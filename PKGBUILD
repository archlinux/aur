# Maintainer: Antarien <dev@antarien.com>
pkgname=ase-explorer
pkgver=0.0.1
pkgrel=1
pkgdesc='ASE Hierarchical Project Explorer with NerdFont Icons'
arch=('x86_64')
url='https://github.com/antarien/ase-client-explorer'
license=('custom')
depends=('gtkmm-4.0' 'libadwaita' 'ttf-fira-code' 'ttf-nerd-fonts-symbols-mono')
makedepends=('cmake' 'ninja' 'gcc' 'pkgconf')
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/ase-client-explorer"
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    ninja -C build
}

package() {
    cd "${srcdir}/ase-client-explorer"
    DESTDIR="${pkgdir}" ninja -C build install
    install -Dm644 packaging/ase-explorer.desktop \
        "${pkgdir}/usr/share/applications/ase-explorer.desktop"
}
