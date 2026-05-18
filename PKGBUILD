# Maintainer: bipin kumar <kbipinkumar _at_ pm.me>

pkgname=python-taxtastic
_name=taxtastic
pkgver=1.0.1
pkgrel=1
pkgdesc='Build and maintain reference trees, reference alignments, profiles, and associated taxonomic information'
arch=('any')
url="https://fhcrc.github.io/taxtastic/index.html"
license=('GPL-3.0-or-later')
provides=("taxtastic")
depends=('python' 'python-dendropy' 'python-fastalite' 'python-yaml' 'python-sqlalchemy' 'python-sqlparse' 'python-decorator' 'python-psycopg2' 'python-psycopg' 'python-jinja')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
  'python-sphinx'
  'python-ghp-import'
  'git'
)
options=(!emptydirs)
source=("${_name}::git+https://github.com/fhcrc/taxtastic.git#tag=v${pkgver}")
b2sums=('aa0fd48e537266d9e34b7b98a27f79bb73669eb32cb48195459bab314feb7e94db79321e763992c8d57a9f3cc3ac521972c4d93f98221913bba80322c2642b04')

build() {
  cd "$srcdir/$_name"
  python -m build --wheel --no-isolation
  cd docs
  make man
}

package() {
  cd "$srcdir/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  cd docs
  install -Dm644 _build/man/taxtastic.1 ${pkgdir}/usr/share/man/man1/taxtastic.1
}
