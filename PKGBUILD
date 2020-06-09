# Maintainer: paperbenni <paperbenni@gmail.com>
if [ -e /tmp/instanttheme ]; then
    echo "theme override found"
    THEME=$(cat /tmp/instanttheme)
else
    THEME=arc
fi

pkgname=instantlock
_pkgname=$pkgname
pkgver=f6e2bb5
pkgrel=1
pkgdesc='lock screen for instantOS'
url='https://github.com/instantOS/instantLOCK.git'
arch=('any')
license=('MIT')
makedepends=('git')
depends=('libxrandr')
source=("$_pkgname::git+https://github.com/instantOS/instantLOCK.git")
sha256sums=('SKIP')

provides=("${_pkgname}" "instantlock")
conflicts=("${_pkgname}" "instantlock")

pkgver() {
    cd $_pkgname
    echo "$(date '+%Y%m%d%H%M')"
}

prepare() {
    cd $_pkgname
    ./theme.sh "$THEME"
}

build() {
    cd "${srcdir}/${_pkgname}"
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
    cd "${srcdir}/${_pkgname}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
