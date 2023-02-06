# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-dvc-objects
_pkgname=${pkgname#python-}
pkgver=0.19.3
pkgrel=1
pkgdesc='DVC objects'
arch=(any)
license=(Apache)
url="https://github.com/iterative/$_pkgname"
_pydeps=(diskcache
         flatten-dict
         fsspec
         funcy
         nanotime
         shortuuid
         tqdm
         typing-extensions)
depends=(python
        "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer} python-setuptools-scm python-wheel)
optdepends=('python-adlfs: azure support'
            'python-azure-identity: azure support'
            'python-knack: azure support'
            'python-pyarrow: hdfs support'
            'python-fsspec: hdfs support'
            'python-aiohttp-retry: http support'
            'python-ossfs: oss support'
            'python-s3fs: s3 support'
            'python-aiobotocore: s3 support'
            'python-boto3: s3 support'
            'python-bcrypt: ssh support'
            'python-sshfs: ssh support'
            'python-webdav4: webdav support')
_archive=("$_pkgname-$pkgver")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_archive.tar.gz")
sha256sums=('0aaf7a81e5ba2c302321b0e8695b600a87efac32c90e3ac82b672c2874af7d47')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
