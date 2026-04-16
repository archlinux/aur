# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

_name=click-extra
pkgname=python-${_name}
pkgver=7.12.0
pkgrel=1
pkgdesc='Drop-in replacement for Click to make user-friendly and colorful CLI.'

url='https://github.com/kdeldycke/click-extra'
license=('GPL-2.0-or-later')
arch=('any')

makedepends=('uv' 'python-pip')
depends=('python' 'python-boltons' 'python-pygments' 'python-click' 'python-json5' 'python-hjson' 'python-tomli' 'python-tomlkit' 'python-yaml' 'python-cloup' 'python-deepmerge' 'python-extra-platforms' 'python-requests' 'python-tabulate' 'python-xmltodict' 'python-wcmatch' 'python-wcwidth' 'python-docutils' 'python-sphinx')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('667ad6c5545cd90fd5e92fd64ac862effb30704bf55c4783e3be9b5ccd9b39325e01e7d4f21f1178ba77b7313f18e5300e85117efb2bdfaab7befa6a7080aa52')

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
