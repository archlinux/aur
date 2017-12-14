# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='snakemake-git'
pkgver=4.3.0.79.gbb1a966
pkgrel=1
pkgdesc="Python-based language and execution environment for GNU Make-like workflows"
arch=('any')
url="https://bitbucket.org/snakemake/snakemake"
license=('MIT')
depends=(
    'python'
    'python-appdirs'
    'python-configargparse'
    'python-ratelimiter'
    'python-requests'
    'python-yaml'
    'python-wrapt')
makedepends=('python-setuptools')
optdepends=(
  'graphviz: For DAG visualization'
  'python-docutils: For report generation'
)
provides=('snakemake')
conflicts=('snakemake')
options=(!emptydirs)
source=("git+https://bitbucket.org/${pkgname//-git/}/${pkgname//-git/}.git")
md5sums=('SKIP')

pkgver() {  # Most recent un-annotated tag from last commit.
  cd "${srcdir}/${pkgname//-git/}"
  git describe --long | sed 's/v\([^-]*-g\)/r\1/;s/-/./g' | sed 's/v\d*//g'
}

package() {
  cd "${srcdir}/${pkgname//-git/}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
