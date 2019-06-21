# Maintainer: klardotsh <josh@klar.sh>
_pkgname=wlrobs
pkgname=${_pkgname}-hg
pkgver=r12.58dab620cca0
pkgrel=1
pkgdesc="An obs-studio plugin that allows you to screen capture on wlroots based wayland compositors"
arch=('i686' 'x86_64')
provides=('wlrobs')
conflicts=(wlrobs)
url="https://hg.sr.ht/~scoopta/wlrobs"
license=('GPL3')
depends=('obs-studio' 'wlroots')
makedepends=(wayland mercurial)
source=("hg+https://hg.sr.ht/~scoopta/${_pkgname}")
md5sums=('SKIP')
_hgrepo="hg"

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd ${srcdir}/${_pkgname}/Release
    make || return 1
}

package() {
    mkdir -p ${pkgdir}/usr/lib/obs-plugins
    install -D -m 0644 ${srcdir}/${_pkgname}/Release/libwlrobs.so \
        ${pkgdir}/usr/lib/obs-plugins/wlrobs.so
}


