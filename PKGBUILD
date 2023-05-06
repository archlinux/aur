# Maintainer: Kyle Laker <kyle+aur@laker.email>

pkgname=chalice
pkgver=1.28.0
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
sha512sums=('f7138768615d2f0decdf8b0e8657fa589e4e2310410f093305f478a72c24b5837f8caa1b9ce33af3b312fb5506e07aec9604aa1f5557d438c03bc9e7e8a49259')

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
