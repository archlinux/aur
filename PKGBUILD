# Maintainer: AlphaLynx <alphaLynx at alphalynx dot dev>

pkgname=python-borgstore
_name=${pkgname#python-}
pkgver=0.3.0
pkgrel=2
pkgdesc='A experimental key/value store implementation, supporting multiple backends'
arch=('any')
url='https://github.com/borgbackup/borgstore'
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
optdepends=(
    'python-boto3: S3 backend'
    'python-botocore: S3 backend'
    'python-paramiko: sftp backend'
    'python-requests: rclone backend'
)
source=("$url/releases/download/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('a7da50ec044f33e489dadae8805ef2e25fd7368a4d43359ab538e6ab03c3bbd1d15eb338ef00678d8ae5b5b11e3a388ec0b154abc2646b46e525124b92dc7611')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
