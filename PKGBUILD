# Contributor: taotieren <admin@taotieren.com>

pkgname=fantascene-gitee
srcname=fantascene-gitee
proname=fantascene-dynamic-wallpaper
pkgver=1.7.8.r0.gb4293b0
pkgrel=1
pkgdesc=" dynamic wallpaper. A very nice animated wallpaper on X11 systems.Support Movie and Web animated wallpaper."
arch=(x86_64
    aarch64
    riscv64)
url="https://gitee.com/liuminghang/fantascene-dynamic-wallpaper"
license=('GPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-git})
depends=(mpv
         qt5-tools
         qt5-x11extras
         qt5-webengine)
makedepends=(git
            pkgconfig
            make)
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd "${srcdir}/${pkgname%-git}"
   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C "${srcdir}/${pkgname%-git}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    qmake ./*.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
    make -C ./build
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make INSTALL_ROOT="${pkgdir}" -C ./build install
}
