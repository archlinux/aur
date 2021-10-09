# Maintainer: Kyle Laker <kyle+aur@laker.email>

pkgname=chalice
pkgver=1.26.0
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
sha512sums=('d9a3c22403f6891e57268edebb356f8b2e9a9cbdaf18223ed2adf281da03ae47e02c8ec0758dbc9e62a9536fb2357ac284e0274afbda7f71d993cbe2ee63fd6c')

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
