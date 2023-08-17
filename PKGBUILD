# Maintainer: taotieren <admin@taotieren.com>

pkgbase=xwm-git
pkgname=xwm-git
pkgver=r1.3ee98ff
pkgrel=1
pkgdesc="XWM (X light Window Manager) XWM is a light-weight window manager forked from jwm for the X11 Window System."
arch=(x86_64
    aarch64
    riscv64)
url="https://gitee.com/xinligg/xwm"
license=('GPL-2.0')
groups=()
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
replaces=()
depends=(
    cairo
    glibc
    fribidi
    libpng
    libjpeg-turbo
    libx11
    libxext
    libxrender
    libxmu
    libxft
    libxinerama
    libxpm)
makedepends=(
    autoconf
    automake
    coreutils
    gettext
    git)
checkdepends=()
optdepends=()
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
#     git describe --long --tags | sed 's/ver.//g;s/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"

    ./autogen.sh
    ./configure --prefix=/usr \
        --sysconfdir=/etc

    make
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make DESTDIR="$pkgdir" install
}
