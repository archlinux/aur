# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributer: Maarten van Gompel <proycon at anaproy dot nl>

_pkgname=smart-open
pkgname=python-${_pkgname}
pkgver=6.3.0
pkgrel=1
pkgdesc="Utils for streaming large files (S3, HDFS, gzip, bz2...)"
arch=(x86_64 aarch64)
url="https://github.com/RaRe-Technologies/smart_open"
license=(MIT)
makedepends=(
    python-build
    python-setuptools
    python-wheel
)
optdepends=(
    'python-boto3: AWS support'
    'python-google-cloud-storage: Google Cloud Storage support'
    'python-azure-core: Azure support'
    'python-azure-common: Azure support'
    'python-azure-storage-blob: Azure support'
    'python-requests: http support'
    'python-paramiko: ssh support'
)
source=("https://github.com/RaRe-Technologies/${_pkgname/-/_}/archive/refs/tags/v${pkgver}.zip")
b2sums=("16e5318702642b55799204c570383adfe24b41e128b2990efcdbe0398490b8aed7488f115d70b401902ac9548170713950f51db6af603a1e1aca8294b7e4f3e0")

build() {
    cd "${_pkgname/-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname/-/_}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
