# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: polyzen
# Contributor: Army
# Contributor: Dan Serban
# Contributor: insanum
# Contributor: Thomas Zervogiannis

pkgname=gcalcli
pkgver=4.5.1
pkgrel=1
pkgdesc='Google calendar command line interface'
arch=('any')
url=https://github.com/insanum/gcalcli
license=('MIT')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
depends=(
    'python-argcomplete'
    'python-babel'
    'python-dateutil'
    'python-google-api-core'
    'python-google-api-python-client'
    'python-google-auth-oauthlib'
    'python-httplib2'
    'python-parsedatetime'
    'python-platformdirs'
    'python-pydantic'
    'python-truststore'
)
optdepends=(
    'python-vobject: for ics/vcal importing'
)
source=("https://pypi.io/packages/source/g/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bbc8d6b9ce40d0be0535ffec3bb3384761400c7fbf1d67716e7d0e5fe9c6f2d5')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

# Disabled because it downloads deps via pip. Report this upstream (if
# they're still alive).
#
# check() {
#     cd "gcalcli-$pkgver"
#     python setup.py test
# }

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 docs/*.{md,png} -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
