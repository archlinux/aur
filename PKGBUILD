# Maintainer: Philipp A. <flying-sheep@web.de>
# Contributor: Kyle Meyer <kyle@kyleam.com>

pkgname=snakemake7
pkgver=7.32.4
pkgrel=2
pkgdesc='Python-based language and execution environment for GNU Make-like workflows'
arch=(any)
url='https://snakemake.readthedocs.io'
depends=(
  python-appdirs
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
  python-stopit
  python-tabulate
  python-throttler
  python-toposort
  python-wrapt
  python-yte
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
provides=(snakemake)
conflicts=(snakemake)
license=(MIT)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('fdc3f15dd7b06fabb7da30d460e0a3b1fba08e4ea91f9c32c47a83705cdc7b6e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  local pyver=$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')
  
#  install -d "$pkgdir/etc/bash_completion.d"
  #FIXME: this needs snakemake bin to install, what if first install?
#  PYTHONPATH="$pkgdir/usr/lib/python$pyver/site-packages:$PYTHONPATH" \
#    "$pkgdir/usr/bin/snakemake" --bash-completion >"$pkgdir/etc/bash_completion.d/snakemake"
}
