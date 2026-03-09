# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-click-extra
_name=${pkgname#python-}
pkgver=7.8.0
pkgrel=1
pkgdesc='Drop-in replacement for Click to make user-friendly and colorful CLI.'
url='https://github.com/kdeldycke/click-extra'

license=('GPL-2.0')
arch=('any')

makedepends=(uv)
depends=(python python-boltons python-click 'python-cloup>=3.0.5' python-deepmerge python-extra-platforms python-yaml python-requests python-tabulate python-xmltodict python-wcmatch python-wcwidth)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('397a86e7321ebb6bfdd9c46f2f0bf80947029fe3efb050cabe1773b247a4d4adf1037bb31e330a7743b45d29ce54809d36e8801290610b020640ca24e02d05c8')

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
