# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-click-extra
_name=${pkgname#python-}
pkgver=6.0.3
pkgrel=1
pkgdesc='Drop-in replacement for Click to make user-friendly and colorful CLI.'
url='https://github.com/kdeldycke/click-extra'
makedepends=(uv)
depends=(python python-boltons python-click 'python-cloup>=3.0.5' python-extra-platforms python-yaml python-requests python-tabulate python-xmltodict python-wcmatch)
#checkdepends=(python-pytest python-pytest-cov python-pytest-httpserver python-pytest-randomly python-pytest-cases)
license=('GPL2')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3ca0d21b2ce8cd99cbbdb25b0c356275557ab3ee5b468c2cc7e82af6252dc9265cd2a105eac096aabfae569f21eb0c4d096ea8a9fa95432420ffc3f1e4d4c05a')

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
