# Maintainer: ResRipper <resripper at connective dot link>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

# shellcheck shell=bash disable=SC2034,SC2148,SC2154,SC2164

_pkgname=migen
pkgname=python-$_pkgname
pkgver=0.9.2
pkgrel=11
pkgdesc='A Python toolbox for building complex digital hardware'
arch=('any')
url='https://git.m-labs.hk/M-Labs/migen'
license=('BSD')
depends=('python-colorama')
makedepends=('python-setuptools')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
    "$url/commit/0fb91737090fe45fd764ea3f71257a4c53c7a4ae.patch"
)
sha512sums=(
    '7856cce7d8c509649291196aa8124df0a4a0a72d273bca7eb12ada92705574eb6fba945cdb8a2d6a5c069188a9fa30d08adf1fc823f3b628796be0fd058cd093'
    'd6da45f3902eb21b93bd6bd07f2a97b4231bbbf273b6fc1068c99b53d5b50855d50f8868b7dd72c25cde722065a5c4d26f4aa35bb3d799b192fa0b3cc3e534cc'
)

prepare() {
    cd "$_pkgname"
    # fhdl/tracer: update to support python 3.11
    patch -Np1 -i ../0fb91737090fe45fd764ea3f71257a4c53c7a4ae.patch
}

build() {
    cd "$_pkgname"
    python setup.py build
}

package() {
    cd "$_pkgname"

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}