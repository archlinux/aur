# Maintainer: tuberry

_srcname=dict-cedict
pkgname=${_srcname}-git
pkgver=20230211.r12.9df2c1f
pkgrel=1
pkgdesc="A port of CC-CEDICT database for dictd et al."
arch=(any)
url=https://www.mdbg.net/chinese/dictionary?page=cc-cedict
license=(CCPL)
depends=(dictd)
makedepends=(dictd git meson curl)
provides=(${_srcname})
conflicts=(${_srcname})
install=${pkgname}.install
source=(git+https://github.com/tuberry/${_srcname})
sha512sums=(SKIP)

pkgver()
{
    cd ${_srcname}
    printf "%s.r%s.%s" \
        $(curl ${url} 2>&1 | grep Latest | grep -Eo '[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}' | tr -d '-') \
        $(git rev-list --count HEAD) \
        $(git rev-parse --short HEAD)
}

build() {
    arch-meson $_srcname build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
