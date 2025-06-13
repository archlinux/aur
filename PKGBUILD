# Maintainer: envolution
# Contributor: Jan Cholasta <grubber at grubber cz>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=zdbsp
pkgver=1.19
pkgrel=2
pkgdesc="Standalone version of ZDoom's internal node builder"
arch=('i686' 'x86_64')
url="http://www.zdoom.org/"
license=('GPL-2.0-only')
depends=('gcc-libs' 'zlib')
makedepends=('cmake')
source=("http://zdoom.org/files/utils/${pkgname}/${pkgname}-${pkgver}-src.zip"
"cmake-minver.patch::https://patch-diff.githubusercontent.com/raw/rheit/zdbsp/pull/7.patch")
sha256sums=('b98956fb1c52f5e25062f829b2468cb8028492add0b7672654763f78dec10249'
            'b239eb7690520ef906b332decf0736be724d8383265c63d066ede49733dbc303')

prepare() {
    patch -Np1 -i cmake-minver.patch
    cmake -DCMAKE_BUILD_TYPE=Release .
}

build() {
    make
}

package() {
    install -D 'zdbsp' "${pkgdir}/usr/bin/zdbsp"
    install -Dm644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
