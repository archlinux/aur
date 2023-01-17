# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-dvc-objects
_pkgname=${pkgname#python-}
pkgver=0.17.0
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
sha256sums=('f97f7c02d412f32fe340472270e4cdf9eef40b0f9aec7ede346aba44c0215979')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
