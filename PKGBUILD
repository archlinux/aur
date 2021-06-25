# Maintainer: Mike Birdgeneau <mike.birdgeneau@gmail.com>
pkgname=fortune-mod-canada-nctr
pkgver=20210624
pkgrel=1
pkgdesc="Fortune quotes from the Truth and Reconciliation Commission of Canada Calls to Action"
arch=('any')
url="https://github.com/mikebirdgeneau/fortune-mod-canada-nctr"
license=('Public domain')
depends=('fortune-mod')
makedepends=('curl')
groups=('fortune-mods')

_dlurl='https://raw.githubusercontent.com/mikebirdgeneau/fortune-mod-canada-nctr/main/nctr'
_verurl="https://raw.githubusercontent.com/mikebirdgeneau/fortune-mod-canada-nctr/main/VERSION"

pkgver()
{
    curl -fL -Ro "${srcdir}/version" "${_verurl}"
    cat "${srcdir}/version"
}

prepare()
{
    msg2 "Downloading data file..."
    curl -Ro "${srcdir}/nctr" "${_dlurl}"
}

build()
{
    strfile "${srcdir}/nctr"
    cd "${srcdir}"

}

package()
{
    cd "${srcdir}"
    install -D -m644 nctr "${pkgdir}/usr/share/fortune/canada-nctr"
    install -D -m644 nctr.dat "${pkgdir}/usr/share/fortune/canada-nctr.dat"
}

