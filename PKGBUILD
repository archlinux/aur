# Maintainer: bipin kumar <kbipinkumar _at_ pm.me>

pkgname=python-taxtastic
_name=taxtastic
pkgver=0.12.0
pkgrel=0
pkgdesc='Build and maintain reference trees, reference alignments, profiles, and associated taxonomic information'
arch=('any')
url="https://fhcrc.github.io/taxtastic/index.html"
license=('GPL-3.0-or-later')
provides=("taxtastic")
depends=('python' 'python-dendropy' 'python-fastalite' 'python-setuptools'  'python-yaml' 'python-importlib-metadata' 'python-sqlalchemy' 'python-pyaml' 'python-sqlparse' 'python-decorator' 'python-psycopg2' 'python-psycopg' 'python-jinja')
makedepends=(
  'python-wheel'
  'python-sphinx'
  'python-ghp-import'
  'git'
)
options=(!emptydirs)
source=("${_name}::git+https://github.com/fhcrc/taxtastic.git#tag=v${pkgver}")
b2sums=('5c4d5ff5daf397ca50eb71101bb275559a7e59f4763c0be58d472267f7579cf46531e67c4333f7cde2696bf3f29e1a3dec17b5a1fbb645911c9ff278ce5f8a2c')

build() {
  cd "$srcdir/$_name"
  python setup.py build
  cd docs
  make man
}

package() {
  cd "$srcdir/$_name"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  cd man
  install -Dm644 taxtastic.1 ${pkgdir}/usr/share/man/man1/taxtastic.1
}
