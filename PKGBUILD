# Maintainer: Ainola
# Contributor: polyzen
# Contributor: Army
# Contributor: Dan Serban
# Contributor: insanum
# Contributor: Thomas Zervogiannis

pkgname=gcalcli
# We are using an alpha version because the ancient 3.4.0 stable version does
# not work well with newer libraries:
# - oauth2client > 1.4.12 renamed 'run' to 'run_flow'
# - https://github.com/insanum/gcalcli/issues/279
pkgver=4.0.0a4
pkgrel=1
pkgdesc='Google calendar command line interface'
arch=('any')
url=https://github.com/insanum/gcalcli
# https://github.com/insanum/gcalcli/issues/390
license=('unknown')  # https://github.com/insanum/gcalcli/issues/390
makedepends=('python-setuptools')
depends=(
    'python-dateutil'
    'python-google-api-python-client'
    'python-httplib2'
    'python-oauth2client'
)
optdepends=(
    'python-vobject: for ics/vcal importing'
    'python-parsedatetime: for fuzzy dates/times like "now", "today", etc.'
)
source=("gcalcli-$pkgver.tar.gz::https://github.com/insanum/gcalcli/archive/v$pkgver.tar.gz")
sha256sums=('0f83f4c3ba9d46d34a412ce8f9311cbe1f1598e5425ec363c6390f0ffcbbd42a')

build() {
    cd "gcalcli-$pkgver"
    python setup.py build
}

check() {
    cd "gcalcli-$pkgver"
    python setup.py test
}

package() {
    cd "gcalcli-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 docs/* -t "$pkgdir/usr/share/docs/$pkgname"
}
