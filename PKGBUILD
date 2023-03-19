# Maintainer: taotieren <admin@taotieren.com>

pkgbase=purc
pkgname=purc
pkgver=0.9.7
pkgrel=3
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
            curl
            gcc
            ncurses
            libjpeg-turbo
            libxml2
            libxslt
            libsoup
            icu
            mariadb
            python
            openssl
            sqlite
            systemd
            pkgconf
            zlib)
optdepends=('python-numpy: Scientific tools for Python'
            'webkit2gtk-hvml: Web content engine for GTK (HVML)'
            'webkit2gtk: Web content engine for GTK'
            'xguipro: xGUI (the X Graphics User Interface) Pro is a modern, cross-platform, and advanced HVML renderer which is based on tailored WebKit.')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/ver-${pkgver}.tar.gz")
sha256sums=('8dff65b5f2bce1e4743c062b29e6860f8e7d37dfa251437473cb5917fc1c37ed')

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
