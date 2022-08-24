# Maintainer: taotieren <admin@taotieren.com>

pkgname=xguipro-git
pkgver=3b2bea0
pkgrel=1
pkgdesc="xGUI (the X Graphics User Interface) Pro is a modern, cross-platform, and advanced HVML renderer which is based on tailored WebKit."
arch=('any')
url="https://github.com/HVML/xGUI-Pro"
license=('LGPL-3.0')
provides=(${pkgname%-git}  'xGUI-Pro')
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=('cmake' 'gcc' 'perl' 'python' 'glib2' 'gtk' 'purc' 'domruler')
makedepends=('git' 'cmake' 'ninja')
optdepends=('ccache')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
#     git describe --long --tags | sed 's/ver.//g;s/\([^-]*-g\)/r\1/;s/-/./g'
    git describe --always --tags | sed 's/ver.//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
# CMake build
#     cmake -DCMAKE_BUILD_TYPE=Debug -DPORT=GTK -B build
#     cmake --build build

# Ninja build
    cmake -DCMAKE_BUILD_TYPE=Debug -DPORT=GTK -B build -G Ninja
    ninja -C build
}

package() {
# make install
#     make -C "${srcdir}"/${pkgname%-git}/build install DESTDIR="${pkgdir}"

# ninja install
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname%-git}/build install
}
