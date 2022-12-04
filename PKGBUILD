# Maintainer: taotieren <admin@taotieren.com>

pkgbase=xguipro-git
pkgname=(xguipro-gtk3-git xguipro-gtk4-git)
pkgver=0.6.1.r5.gcb2ca06
pkgrel=1
pkgdesc="xGUI (the X Graphics User Interface) Pro is a modern, cross-platform, and advanced HVML renderer which is based on tailored WebKit."
arch=('x86_64' 'aarch64' 'mips64' 'powerpc' 'powerpc64le')
url="https://github.com/HVML/xGUI-Pro"
license=('LGPL-3.0')
groups=('hvml-git')
provides=(${pkgbase%-git}  'xGUI-Pro')
conflicts=(${pkgbase%-git})
replaces=()
depends=('glib2' 'gperf' 'enchant')
makedepends=('git' 'cmake' 'ninja' 'ccache' 'gcc' 'python' 'libxml2' 'ruby' 'curl' 'openssl' 'sqlite' 'pkgconf' 'zlib' 'icu' 'webkit2gtk-hvml')
optdepends=('purc: The prime HVML interpreter for C Language.'
            'purc-midnight-commander: A generic HVML renderer in text mode for development and debugging.'
            'webkit2gtk-hvml: Web content engine for GTK (HVML)')
backup=()
options=('!strip')
install=
source=("${pkgbase%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgbase%-git}/"
#     git describe --long --tags | sed 's/ver.//g;s/\([^-]*-g\)/r\1/;s/-/./g'
    git describe --always --tags | sed 's/ver.//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_xguipro-gtk3-git() {
    pkgdesc+=" (gtk3)"
    depends+=('gtk3' 'libsoup2')
    conflicts=(${pkgbase%-git})

    cd "${srcdir}/${pkgbase%-git}"

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
#     make -C "${srcdir}"/${pkgbase%-git}/build install DESTDIR="${pkgdir}"

# ninja install
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgbase%-git}/build-gtk3 install
}

package_xguipro-gtk4-git() {
    pkgdesc+=" (gtk4)"
    depends+=('gtk4' 'libsoup3')
    conflicts=(${pkgbase%-git})

    cd "${srcdir}/${pkgbase%-git}"

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
#     make -C "${srcdir}"/${pkgbase%-git}/build install DESTDIR="${pkgdir}"

# ninja install
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgbase%-git}/build-gtk4 install
}
