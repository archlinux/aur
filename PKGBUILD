# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-click-extra
_name=${pkgname#python-}
pkgver=5.0.0
pkgrel=1
pkgdesc='Drop-in replacement for Click to make user-friendly and colorful CLI.'
url='https://github.com/kdeldycke/click-extra'
makedepends=(uv)
depends=(python python-boltons python-click 'python-cloup>=3.0.5' python-commentjson python-extra-platforms python-mergedeep python-yaml python-requests python-tabulate python-xmltodict python-wcmatch)
#checkdepends=(python-pytest python-pytest-cov python-pytest-httpserver python-pytest-randomly python-pytest-cases)
license=('GPL2')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('683bdb93fb4c3dee872874b16b49ef0979439e02b868422c9760ec114b3856b782956a1f05859eb4abb8f296b9074db7b234a96c13f6eb34a9f33b101196b175')

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
