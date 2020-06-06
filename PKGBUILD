# Maintainer: Syaoran Code <syaorancode@gmail.com>

pkgname=dwm-syaoran-git
_dir=dwm-syaoran
pkgver=6.2.r60.eb07ded
pkgrel=1
pkgdesc="This is my dwm (dynamic window manager) build."
arch=('any')
url="https://gitlab.com/justanoobcoder/dwm-syaoran.git"
license=('MIT')
depends=(libx11 libxinerama ttf-liberation ttf-font-awesome noto-fonts-emoji freetype2 pacman-contrib ibus ibus-bamboo)
makedepends=(make)
provides=(dwm)
conflicts=(dwm)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "${_dir}"
    printf "%s.r%s.%s" "$(awk '/^VERSION =/ {print $3}' config.mk)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_dir}"
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
    cd "${_dir}"
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -m644 -D "$srcdir/${_dir}/dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"
}

