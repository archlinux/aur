# Maintainer: Ainola <ainola@archlinux.org>
# Contributor: polyzen
# Contributor: Army
# Contributor: Dan Serban
# Contributor: insanum
# Contributor: Thomas Zervogiannis

pkgname=gcalcli
pkgver=4.0.2
pkgrel=1
pkgdesc='Google calendar command line interface'
arch=('any')
url=https://github.com/insanum/gcalcli
license=('MIT')
makedepends=('python-setuptools')
depends=(
    'python-dateutil'
    'python-google-api-python-client'
    'python-httplib2'
    'python-oauth2client'
    'python-parsedatetime'
)
optdepends=(
    'python-vobject: for ics/vcal importing'
)
source=("gcalcli-$pkgver.tar.gz::https://github.com/insanum/gcalcli/archive/v$pkgver.tar.gz")
sha256sums=('d1d2b19dd5e31c5cb68ab2f8e2b52c221b0f80bb753746b5e98bdd3f3087338f')

prepare() {
    # By default wants to install in /usr/man/man1/
    sed -i 's;man/man1;share/man/man1;' "gcalcli-$pkgver/setup.py"
}

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
    install -Dm644 docs/*.{md,png} -t "$pkgdir/usr/share/docs/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
