# Maintainer: Kyle Laker <kyle+aur@laker.email>

pkgname=chalice
pkgver=1.22.3
pkgrel=1
pkgdesc="Python Serverless Microframework for AWS"
arch=("any")
url="https://github.com/aws/chalice"
license=("Apache")
depends=(\
    "python"
    "python-click"
    "python-botocore"
    "python-mypy_extensions"
    "python-six"
    "python-pip"
    "python-attrs"
    "python-jmespath"
    "python-yaml"
    "python-inquirer"
    "python-wheel"
    "python-setuptools"
)
makedepends=("python-setuptools" "mypy")
optdepends=('python-watchdog: server auto-reload support'
            'aws-cdk: AWS CDK support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aws/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('9fc5c1e850a44c24e037fa260d95193f5962e45aad59ff5a2dea830b2c74fc5f0508a32dfdc7fca675b374dc399c52de66893c4e9edf4afcfca1a94f84215c2a')

prepare() {
    cd "${srcdir}/$pkgname-$pkgver"
    # Fix the tests getting included in the package
    sed -i' ' -e "s/'tests'/'tests*'/" setup.py
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
