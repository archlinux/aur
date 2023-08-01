# Maintainer: taotieren <admin@taotieren.com>

pkgbase=purc
pkgname=purc
pkgver=0.9.14
pkgrel=0
pkgdesc="The prime HVML interpreter for C/C++ Language."
arch=(x86_64
    aarch64
    riscv64
    mips64
    powerpc
    powerpc64le)
url="https://github.com/HVML/PurC"
license=('LGPL-3.0')
groups=(hvml
    hybridos2)
provides=(${pkgname}
    csseng
    domruler
    purc-fetcher
    libcsseng.so
    libpurc-dvobj-PY.so
    libpurc-dvobj-FS.so
    libpurc-dvobj-MATH.so
    libpurc-fetcher.so
    libdomruler.so
    libpurc.so)
conflicts=(${pkgname})
replaces=(domruler
    purc-fetcher)
depends=(glib2
    glibc
    python)
makedepends=(bison
    cmake
    cython
    flex
    git
    ninja
    ccache
    curl
    gcc
    gperf
    lua-lgi
    ncurses
    libgcrypt
    libjpeg-turbo
    libnotify
    libmanette
    libtasn1
    libsecret
    libseccomp
    libpsl
    libxml2
    libxslt
    libsoup
    icu
    mariadb
    openssl
    sqlite
    systemd
    pkgconf
    zlib)
checkdepends=(check
    gtest
    valgrind)
optdepends=('python-numpy: Scientific tools for Python'
    'webkit2gtk-hvml: Web content engine for GTK (HVML)'
    'webkit2gtk: Web content engine for GTK'
    'xguipro: xGUI (the X Graphics User Interface) Pro is a modern, cross-platform, and advanced HVML renderer which is based on tailored WebKit.')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/ver-${pkgver//./-}.tar.gz")
sha256sums=('060408fbb86db0f61aa5db693036f044fb95b3c14a3e4a9c07bbf339efc7fc0d')
options=('!strip')

build() {
    cd "${srcdir}/PurC-ver-${pkgver//./-}/"

# see：https://wiki.archlinux.org/title/CMake_package_guidelines
#     cmake -DCMAKE_BUILD_TYPE=Release \
    cmake -DCMAKE_BUILD_TYPE=None \
        -DPORT=Linux \
        -DENABLE_CHINESE_NAMES=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/PurC-ver-${pkgver//./-}/build install
}
