# Maintainer: taotieren <admin@taotieren.com>

pkgbase=purc
pkgname=purc
pkgver=0.9.7
pkgrel=0
pkgdesc="The prime HVML interpreter for C Language."
arch=(x86_64
    aarch64
    mips64
    powerpc
    powerpc64le)
url="https://github.com/HVML/PurC"
license=('LGPL-3.0')
groups=('hvml')
provides=(${pkgname}
        PurC
        domruler
        purc-fetcher)
conflicts=(${pkgname})
replaces=(domruler
        purc-fetcher)
depends=(glib2
        bison
        flex)
makedepends=(git
            cmake
            ninja
            ccache
            gcc
            python
            libxml2
            ruby
            curl
            openssl
            sqlite
            pkgconf
            zlib
            icu)
optdepends=('purc-midnight-commander: A generic HVML renderer in text mode for development and debugging.'
            'webkit2gtk-hvml: Web content engine for GTK (HVML)'
            'webkit2gtk: Web content engine for GTK'
            'xguipro: xGUI (the X Graphics User Interface) Pro is a modern, cross-platform, and advanced HVML renderer which is based on tailored WebKit.')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/ver-${pkgver}.tar.gz")
sha256sums=('3100206269d0dddf13ab4f1138c21a692870ec4b82ce94c076f8786020a02336')

build() {
    cd "${srcdir}/PurC-ver-${pkgver}/"

# see：https://wiki.archlinux.org/title/CMake_package_guidelines
#     cmake -DCMAKE_BUILD_TYPE=Release \
    cmake -DCMAKE_BUILD_TYPE=None \
        -DPORT=Linux \
        -DENABLE_API_TESTS=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/PurC-ver-${pkgver}/build install
}
