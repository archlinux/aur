# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-click-extra
_name=${pkgname#python-}
pkgver=7.7.0
pkgrel=1
pkgdesc='Drop-in replacement for Click to make user-friendly and colorful CLI.'
url='https://github.com/kdeldycke/click-extra'

license=('GPL-2.0')
arch=('any')

makedepends=(uv)
depends=(python python-boltons python-click 'python-cloup>=3.0.5' python-deepmerge python-extra-platforms python-yaml python-requests python-tabulate python-xmltodict python-wcmatch python-wcwidth)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('0a613845d3f60e01601a66163b0b7a45cc4ae5da37d1fa7f7626abebda2c4edee69bb46c82a644bce4565c10f046a520552c0616e3e975c056531011ce7762ed')

build() {
    cd "${srcdir}/${_name}-${pkgver}"

    uv build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"

    uv pip install --system --link-mode=copy --no-deps --prefix="${pkgdir}/usr" dist/*.whl

    rm "$pkgdir/usr/.lock"

    install -Dm0644 license "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
