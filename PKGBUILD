# Maintainer: Kaleb <vitor.guttler@edu.pucrs.br>
pkgname=python-localstack-client
pkgver=2.12
pkgrel=1
pkgdesc="A lightweight Python client for LocalStack"
arch=('any')
url="https://github.com/localstack/localstack-python-client"
license=('Apache-2.0')
depends=('python' 'python-boto3')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/88/99/f0cb24bd7687765f37ce6a577736a4a13501054be66eb748ddd4a13e6592/localstack_client-$pkgver.tar.gz")
sha256sums=('dbb98712fd2c8869d5dfed7a2ca006b95c7750fe9a43af123ef054efc7e7ebb4')

build() {
    # Upstream's sdist directory name changed from "localstack_client-X"
    # (underscore) to "localstack-client-X" (hyphen) as of 2.12, likely a
    # packaging-metadata change upstream. Verified directly: 2.10's tarball
    # extracts to localstack_client-2.10, 2.12's to localstack-client-2.12.
    cd "localstack-client-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "localstack-client-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
