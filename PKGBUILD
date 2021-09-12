# Maintainer: Brett Cornwall <ainola@archlinux.org>

pkgname=awsume
pkgver=4.5.3
pkgrel=1
pkgdesc="A convenient way to manage AWS session tokens and assume role credentials"
arch=('any')
url="https://awsu.me/"
license=('MIT')
makedepends=(
    'python-setuptools'
    'python-pytest'
    'python-pytest-runner'
)
depends=(
    'python-argcomplete'
    'python-boto3'
    'python-colorama'
    'python-coverage'
    'python-pluggy'
    'python-psutil'
    'python-xmltodict'
    'python-yaml'
)
optdepends=(
    'python-levenshtein: Fuzzy support'
    'python-xmltodict: SAML support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/trek10inc/awsume/archive/$pkgver.tar.gz")
sha256sums=('19cdaa043519b88fe9a0cb8546ac55bedddb2a580c6d6f6d52bec35174cc2eae')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

check() {
    cd "$pkgname-$pkgver"
    python setup.py pytest
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

    rm -f "$pkgdir/usr/bin/awsume.bat"
    rm -f "$pkgdir/usr/bin/awsume.ps1"
}
