# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=newsoul
pkgver=0.2.1
pkgrel=1
pkgdesc="Museek+, a daemon/server based Soulseek client, resurrected."
arch=('i686' 'x86_64')
url="https://github.com/KenjiTakahashi/newsoul"
license=('GPL3')
depends=(
    'json-c'
    'libevent'
    'taglib'
    'nettle'
    'sqlite'
    'pcre'
)
optdepends=('python2-crypto: some python utils')
makedepends=('python2' 'premake')
source=("https://github.com/KenjiTakahashi/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('fc649edef6751da8533ba94ceb12ec8e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"

    premake4 gmake
    make newsoul
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"

    premake4 --prefix="${pkgdir}" install

    cd ../python-bindings
    python2 setup.py install --root=${pkgdir}/ --optimize=1

    cd ../python-utils
    python2 setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=4 sw=4 et:
