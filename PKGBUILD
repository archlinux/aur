# Contributor: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=google_cloud_translate
pkgname=python-google-cloud-translate
pkgver=3.20.1
pkgrel=1
pkgdesc="Google Cloud Translation API client library"
url="https://pypi.org/project/google-cloud-translate/"
depends=(
    'python-google-api-core'
    'python-google-auth'
    'python-google-cloud-core' # AUR
    'python-grpc-google-iam-v1' # AUR
    'python-proto-plus' # AUR
    'python-protobuf'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('Apache-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('83a28ef97c4af2744acbdfe662439728741a56d89548522b4fab008663c91901')

prepare() {
    cd "${_pkgname}-${pkgver}"
    sed -i '1,3d' setup.cfg
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir/" dist/*.whl
}

