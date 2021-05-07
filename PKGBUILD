# Maintainer: Kyle Laker <kyle+aur@laker.email>

pkgname=chalice
pkgver=1.22.4
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
sha512sums=('80ccda2d4cacd79301f398d6e2aa1784a596c5e41540a1cbbb5b3d64ea467a504415fc4608f74ff40abfd136a805ea7d774b5ec07c7fb851ba49288b26055843')

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
