# Maintainer : deltaDelete <samansy@yandex.ru>

pkgname=vlsh-git
_pkgname=vlsh
pkgver=r2.9d518c5
pkgrel=1
pkgdesc="gtk4-layer-shell video wallpaper"
arch=('i686' 'x86_64')
url="https://github.com/deltaDelete/vlsh"
license=('MIT')
provides=('vlsh')
conflicts=('vlsh-bin')
depends=('gtk4' 'gtk4-layer-shell' 'pango' 'gdk-pixbuf2' 'cairo' 'glib2' 'glibc' 'gcc-libs')
makedepends=('rust' 'cargo' 'git')
source=('git+https://github.com/deltaDelete/vlsh.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release --locked
}

package() {
    install -Dm 755 "${srcdir}/${_pkgname}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}/"
}

