# Maintainer: Kaleb <vitor.guttler@edu.pucrs.br>
pkgname=python-boto3-git
pkgver=1.35.90.r0.g12345ab
pkgrel=1
pkgdesc="Boto3, an AWS SDK for Python"
arch=('any')
url="https://github.com/boto/boto3"
license=('Apache-2.0')
depends=('python' 'python-botocore' 'python-jmespath' 'python-s3transfer')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('python-boto3')
conflicts=('python-boto3')
source=("git+https://github.com/boto/boto3.git")
sha256sums=('SKIP')

pkgver() {
    cd "boto3"
    # Get the latest tag version and combine with revision count and short hash
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "boto3"
    python -m build --wheel --no-isolation
}

package() {
    cd "boto3"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
