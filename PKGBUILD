# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Philipp A. <flying-sheep@web.de>
# Contributor: Kyle Meyer <kyle@kyleam.com>
pkgname=snakemake
pkgver=9.19.0
pkgrel=2
pkgdesc='Python-based language and execution environment for GNU Make-like workflows'
arch=(any)
url='https://snakemake.readthedocs.io'
depends=(
    python-appdirs
    python-immutables
    python-configargparse
    python-connection_pool
    python-docutils
    python-gitpython
    python-humanfriendly
    'python-jinja>=1:3.0' 'python-jinja<1:4.0'
    python-jsonschema
    jupyter-nbformat
    python-packaging
    python-psutil
    'python-pulp>=2.3.1'
    python-yaml
    python-referencing
    'python-requests>=2.8.1' 'python-requests<3.0'
    python-tenacity
    'python-smart_open>=4.0' 'python-smart_open<8.0'
    'python-snakemake-interface-common>=1.20.1'
    'python-snakemake-interface-executor-plugins>=9.3.2'
    'python-snakemake-interface-logger-plugins>=1.1.0'
    'python-snakemake-interface-storage-plugins>=4.3.2'
    'python-snakemake-interface-report-plugins>=1.2.0'
    'python-snakemake-interface-scheduler-plugins>=2.0.0'
    python-tabulate
    python-throttler
    python-wrapt
    'python-yte>=1.5.5' 'python-yte<2.0'
    'python-dpath>=2.1.6' 'python-dpath<3.0.0'
    'python-conda-inject>=1.3.1' 'python-conda-inject<2.0'
    'python-sqlmodel>=0.0.37'
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
sha256sums=('c7d3fbbf00b1bdf992bc61b9dcee21b5c3fb95a038cd58d53c6369a7c4f0609e')

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
