# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-click-extra
_name=${pkgname#python-}
pkgver=4.14.2
pkgrel=1
pkgdesc='Extra colorization and configuration loading for Click.'
url='https://kdeldycke.github.io/click-extra/'
makedepends=(uv)
depends=(python python-boltons python-click 'python-cloup>=3.0.5' python-commentjson python-extra-platforms python-mergedeep python-yaml python-requests python-tabulate python-xmltodict python-wcmatch)
#checkdepends=(python-pytest python-pytest-cov python-pytest-httpserver python-pytest-randomly python-pytest-cases)
license=('GPL2')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ca7bb6ce5dd1a9152a7c74344240e094a7b11ca2cebbdab984442aa2a5eed1c4428d0e2b9b79feabe49f11c4f903d9052203d72c129afff1a774f36054e6f20a')

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
