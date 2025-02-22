# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-click-extra
_name=${pkgname#python-}
pkgver=4.14.1
pkgrel=1
pkgdesc='Extra colorization and configuration loading for Click.'
url='https://kdeldycke.github.io/click-extra/'
makedepends=(uv)
depends=(python python-boltons python-click 'python-cloup>=3.0.5' python-commentjson python-extra-platforms python-mergedeep python-yaml python-requests python-tabulate python-xmltodict python-wcmatch)
checkdepends=(python-pytest python-pytest-cov python-pytest-httpserver python-pytest-randomly python-pytest-cases)
license=('GPL2')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('1e42a7f8faba583e3a8db732de5981b66cfb53e64df019ed5b1d7a746755111872a7ded23f55acabda62320dbb382189bd213fd605d9086eea821d10c6123bd9')

build() {
    cd "$srcdir/$_name-$pkgver"
    uv build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    uv pip install --system --link-mode=copy --no-deps --prefix="$pkgdir/usr" dist/*.whl
    rm "$pkgdir/usr/.lock"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" license
}
