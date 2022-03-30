# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Mr. Outis <mroutis@protonmail.com>

pkgname=dvc
pkgver=2.10.0
pkgrel=1
pkgdesc='Open-source version control system for data science projects'
arch=(any)
license=(Apache)
url="https://github.com/iterative/${pkgname}"
_pydeps=(aiohttp-retry
         appdirs
         benedict
         colorama
         configobj
         dpath
         dictdiffer
         diskcache
         distro
         flatten-dict
         flufl-lock
         fsspec
         funcy
         gitdb
         gitpython
         grandalf
         humanize
         inflect
         nanotime
         nanotime
         ntfs
         packaging
         pathspec
         ply
         pyasn1
         pydot
         pygtrie
         requests
         ruamel-yaml
         scmrepo
         shortuuid
         shtab
         tqdm
         treelib
         voluptuous
         yaml
         zc.lockfile)
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
makedepends=(python-{build,installer} python-setuptools-scm{,-git-archive} python-wheel)
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
sha256sums=('ac07c3f185e7fd2dae689c7507ed99438d1247c8742eb2d182bf98d78fcdcce8')

build() {
	cd "$_archive"
	python -m build -wn
}

# check() {
#     cd "$_archive"
#     # Disable tests that rely on remote data or specific filesystem types
#     pytest \
#         --deselect tests/remotes/__init__.py
# }

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
