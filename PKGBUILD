# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Mr. Outis <mroutis@protonmail.com>

pkgname=dvc
pkgver=2.9.3
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
            'python-azure-storage: support for Azure remote'
            'python-boto3: support for AWS S3 remote'
            'python-fsspec: support for HDFS remote'
            'python-google-api-python-client: support for GDrive'
            'python-kerberos: support for webhfs'
            'python-oss2: support for Aliyun Object Storage Service'
            'python-paramiko: support for SSH remote'
            'python-pyarrow: support for HDFS remote'
            'python-pydrive: support for GDrive'
            'python-s3fs: support for AWS S3 remote')
makedepends=(python-setuptools)
# checkdepends=(mypy
#               python-flaky
#               python-fsspec
#               python-mock
#               # python-pylint-plugin-utils
#               python-pytest
#               python-pytest-lazy-fixture
#               python-pytest-timeout
#               python-pytest-xdist
#               python-rangehttpserver
#               python-tabulate
#               python-toml
#               python-typing_extensions
#               python-requests)
_archive=("$pkgname-$pkgver")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('513d0d9ee3c3123e616f760eb8556ee569121286c3e400a1fe4b3bf66e6dea29')

build() {
	cd "$_archive"
	python setup.py build
}

# check() {
#     cd "$_archive"
#     # Disable tests that rely on remote data or specific filesystem types
#     pytest \
#         --deselect tests/remotes/__init__.py
# }

package() {
	cd "$_archive"
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
