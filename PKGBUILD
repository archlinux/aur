# Maintainer: Thore Bödecker <me [at] foxxx0.de>
# Contributor: Michał Sałaban <michal@salaban.info>

pkgname=python2-diff-match-patch
_pkgbase="${pkgname#python2-}"
pkgver=20181111
pkgrel=1
pkgdesc='The Diff Match and Patch libraries offer robust algorithms to perform the operations required for synchronizing plain text'
arch=('any')
url='https://github.com/google/diff-match-patch'
license=('Apache')
depends=('python2')
makedepends=('python2' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgbase:0:1}/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('a809a996d0f09b9bbd59e9bbd0b71eed8c807922512910e05cbd3f9480712ddb')

prepare() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  while read -r FILE; do
    sed -i 's|^#!/usr/bin/python2.4|#!/usr/bin/python2|1' "$FILE"
  done < <(find . -iname '*.py')
}

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py test
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="$pkgdir/"
}

# vim: set ft=sh ts=2 sw=2 et:
