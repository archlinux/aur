# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Philipp A. <flying-sheep@web.de>
# Contributor: Kyle Meyer <kyle@kyleam.com>

pkgname=snakemake
pkgver=8.4.8
pkgrel=1
pkgdesc='Python-based language and execution environment for GNU Make-like workflows'
arch=(any)
url='https://snakemake.readthedocs.io'
depends=(
    python-appdirs
    python-immutables
    python-configargparse
    python-connection_pool
    python-datrie
    python-docutils
    python-gitpython
    python-humanfriendly
    python-jinja
    python-jsonschema
    jupyter-nbformat
    python-packaging
    python-psutil
    'python-pulp>=2.0'
    python-yaml
    python-requests
    python-reretry
    'python-smart_open>=3.0'
    python-snakemake-interface-executor-plugins
    python-snakemake-interface-common
    python-snakemake-interface-storage-plugins
    python-stopit
    python-tabulate
    python-throttler
    python-toposort
    python-wrapt
    python-yte
    python-dpath
    python-conda-inject
)
makedepends=(python-setuptools python-build python-installer python-wheel)
optdepends=(
    'python-pygments: For report generation'
    'python-biopython: For GenBank/NCBI Entrez support'
    'python-easywebdav: For WebDAV support'
    'python-pysftp: For SFTP support'
    'python-boto3: For AWS support'
    'python-moto: For AWS support'
    'python-dropbox: For Dropbox support'
    'python-ftputil: For FTP support'
    'python-xrootd: For XRootD support'
    'slacker: For messaging'
)
license=(MIT)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ab64a4f402f78ec252f211d9cc900344fdc2a000dadcec91833efb5fd0f275e7')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
#   local pyver=$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')
#   install -d "$pkgdir/etc/bash_completion.d"
#   PYTHONPATH="$pkgdir/usr/lib/python$pyver/site-packages:$PYTHONPATH" \
#       "$pkgdir/usr/bin/snakemake" --bash-completion >"$pkgdir/etc/bash_completion.d/snakemake"
}
