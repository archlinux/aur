# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Mr. Outis <mroutis@protonmail.com>

pkgname=dvc
pkgver=2.9.2
pkgrel=1
pkgdesc='Open-source version control system for data science projects'
arch=(any)
license=(Apache)
url="https://github.com/iterative/${pkgname}"
_pydeps=(appdirs
         colorama
         configobj
         distro
         flufl-lock
         funcy
         gitdb
         gitpython
         humanize
         inflect
         packaging
         pathspec
         ply
         pyasn1
         yaml
         requests
         ruamel-yaml
         shortuuid
         tqdm
         treelib
         voluptuous
         zc.lockfile
         nanotime
         grandalf
         ntfs
         shtab
         pygtrie)
depends=(python
        "${_pydeps[@]/#/python-}")
optdepends=('python-google-cloud-storage: support for Google Cloud'
            'python-google-api-python-client: support for GDrive'
            'python-pydrive: support for GDrive'
            'python-boto3: support for AWS S3 remote'
            'python-paramiko: support for SSH remote'
            'python-azure-storage: support for Azure remote'
            'python-oss2: support for Aliyun Object Storage Service'
            'python-pyarrow: support for HDFS remote')
makedepends=(python-setuptools)
_archive=("$pkgname-$pkgver")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('543257907a843952c44bdb1ea84f2ae33d8693584c1175eb49eb95da0c2a2e49')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
