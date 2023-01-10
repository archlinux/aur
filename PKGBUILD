# Maintainer: taotieren <admin@taotieren.com>

pkgbase=xguipro
pkgname=(xguipro-gtk3 xguipro-gtk4)
pkgver=0.6.2
pkgrel=0
pkgdesc="xGUI (the X Graphics User Interface) Pro is a modern, cross-platform, and advanced HVML renderer which is based on tailored WebKit."
arch=('x86_64' 'aarch64' 'mips64' 'powerpc' 'powerpc64le')
url="https://github.com/HVML/xGUI-Pro"
license=('LGPL-3.0')
groups=('hvml-git')
provides=(${pkgbase}  'xGUI-Pro')
conflicts=(${pkgbase})
replaces=()
depends=('glib2' 'gperf' 'enchant')
makedepends=('git' 'cmake' 'ninja' 'ccache' 'gcc' 'python' 'libxml2' 'ruby' 'curl' 'openssl' 'sqlite' 'pkgconf' 'zlib' 'icu' 'webkit2gtk-hvml' 'patch')
optdepends=('purc: The prime HVML interpreter for C Language.'
            'purc-midnight-commander: A generic HVML renderer in text mode for development and debugging.'
            'webkit2gtk-hvml: Web content engine for GTK (HVML)')
backup=()
options=()
install=
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/ver-${pkgver}.tar.gz")
sha256sums=('af8e68d269901884987326f41c318e2def786d49ab1794780d86346b5331f25e')

# prepare() {
#     cd "${srcdir}/xGUI-Pro-ver-${pkgver}/"
#     patch -p1 < ../fix-ver-0.6.1.patch
# }

package_xguipro-gtk3() {
    pkgdesc+=" (gtk3)"
    depends+=('gtk3' 'libsoup')
    conflicts=(${pkgbase})

    cd "${srcdir}/xGUI-Pro-ver-${pkgver}/"

# CMake build
#     cmake -DCMAKE_BUILD_TYPE=Release \
#         -DPORT=GTK \
#         -DCMAKE_INSTALL_PREFIX=/usr \
#         -DCMAKE_INSTALL_LIBDIR=lib \
#         -DCMAKE_INSTALL_LIBEXECDIR=lib \
#         -DENABLE_GAMEPAD=OFF \
#         -DENABLE_INTROSPECTION=OFF \
#         -DUSE_SOUP2=ON \
#         -DUSE_WPE_RENDERER=OFF \
#         -DUSE_LCMS=OFF \
#         -B build-gtk3 \

#     cmake --build build-gtk3
# Ninja build
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DPORT=GTK \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -DENABLE_GAMEPAD=OFF \
        -DENABLE_INTROSPECTION=OFF \
        -DUSE_SOUP2=ON \
        -DUSE_WPE_RENDERER=OFF \
        -DUSE_LCMS=OFF \
        -B build-gtk3 \
        -G Ninja

    ninja -C build-gtk3
# make install
#     make -C "${srcdir}"/xGUI-Pro-ver-${pkgver}/build-gtk3 install DESTDIR="${pkgdir}"

# ninja install
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/xGUI-Pro-ver-${pkgver}/build-gtk3 install
}

package_xguipro-gtk4() {
    pkgdesc+=" (gtk4)"
    depends+=('gtk4' 'libsoup3')
    conflicts=(${pkgbase})

    cd "${srcdir}/xGUI-Pro-ver-${pkgver}/"

# CMake build
#     cmake -DCMAKE_BUILD_TYPE=Release \
#         -DPORT=GTK \
#         -DCMAKE_INSTALL_PREFIX=/usr \
#         -DCMAKE_INSTALL_LIBDIR=lib \
#         -DCMAKE_INSTALL_LIBEXECDIR=lib \
#         -DENABLE_GAMEPAD=OFF \
#         -DENABLE_INTROSPECTION=OFF \
#         -DUSE_SOUP3=ON \
#         -DUSE_WPE_RENDERER=OFF \
#         -DUSE_LCMS=OFF \
#         -B build-gtk4 \

#     cmake --build build-gtk4

# Ninja build
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DPORT=GTK \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -DENABLE_GAMEPAD=OFF \
        -DENABLE_INTROSPECTION=OFF \
        -DUSE_SOUP3=ON \
        -DUSE_WPE_RENDERER=OFF \
        -DUSE_LCMS=OFF \
        -B build-gtk4 \
        -G Ninja

    ninja -C build-gtk4
# make install
#     make -C "${srcdir}"/xGUI-Pro-ver-${pkgver}/build-gtk4 install DESTDIR="${pkgdir}"

# ninja install
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/xGUI-Pro-ver-${pkgver}/build-gtk4 install
}
