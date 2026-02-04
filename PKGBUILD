# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-click-extra
_name=${pkgname#python-}
pkgver=7.5.0
pkgrel=1
pkgdesc='Drop-in replacement for Click to make user-friendly and colorful CLI.'
url='https://github.com/kdeldycke/click-extra'
makedepends=(uv)
depends=(python python-boltons python-click 'python-cloup>=3.0.5' python-deepmerge python-extra-platforms python-yaml python-requests python-tabulate python-xmltodict python-wcmatch python-wcwidth)
#checkdepends=(python-pytest python-pytest-cov python-pytest-httpserver python-pytest-randomly python-pytest-cases)
license=('GPL2')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b6414e656e3ae0908c98b1b9c36fc4dd7f64841a4412b28d75ae4930b710a9aa129217ce2ae8143abea4afc3a3ba1e4eb70b475d51f3d8888d6f19482ede0c2b')

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
