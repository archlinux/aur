# Maintainer: Kyle Laker <kyle+aur@laker.email>

pkgname=chalice
pkgver=1.23.0
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
sha512sums=('e296c28ab6d1d166dd9114c9abd1fac9d3b8c68646f630c5a045e3e0aef6c495aef4c720f8ca55697771107d700a917a299ae2c7a852ee263c1df556b6444e99')

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
