# Maintainer: Kaleb <vitor.guttler@edu.pucrs.br>
pkgname=python-localstack-client
pkgver=2.10
pkgrel=1
pkgdesc="A lightweight Python client for LocalStack"
arch=('any')
url="https://github.com/localstack/localstack-python-client"
license=('Apache-2.0')
depends=('python' 'python-boto3')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/22/11/4f10b87d634edd616d8063dd0ed1193be747e524e28801f826d72828b98f/localstack_client-$pkgver.tar.gz")
sha256sums=('732a07e23fffd6a581af2714bbe006ad6f884ac4f8ac955211a8a63321cdc409')

build() {
    cd "localstack_client-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "localstack_client-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
