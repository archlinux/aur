# Maintainer: taotieren <admin@taotieren.com>

pkgbase=purc
pkgname=purc
pkgver=0.9.6
pkgrel=0
pkgdesc="The prime HVML interpreter for C Language."
arch=('x86_64' 'aarch64' 'mips64' 'powerpc' 'powerpc64le')
url="https://github.com/HVML/PurC"
license=('LGPL-3.0')
groups=('hvml')
provides=(${pkgname} 'PurC')
conflicts=(${pkgname})
replaces=()
depends=(glib2 bison flex)
makedepends=(cmake ninja ccache gcc python libxml2 ruby curl openssl sqlite pkgconf zlib icu)
optdepends=('purc-midnight-commander: A generic HVML renderer in text mode for development and debugging.'
            'webkit2gtk-hvml: Web content engine for GTK (HVML)'
            'xguipro: xGUI (the X Graphics User Interface) Pro is a modern, cross-platform, and advanced HVML renderer which is based on tailored WebKit.')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/ver-${pkgver}.tar.gz")
sha256sums=('3b648e546bb8b43ef32f15b8dfd3fe37d1cfe22202f1230697be51469b6fdf5c')

build() {
    cd "${srcdir}/PurC-ver-${pkgver}/"

# Ninja build
    cmake -DCMAKE_BUILD_TYPE=Release \
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
# ninja install
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/PurC-ver-${pkgver}/build install
}
