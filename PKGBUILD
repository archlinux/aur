# Contributor : Guillaume Horel <guillaume dot horel at gmail dot com>
# Contributor :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Contributor : Giovanni Scafora <giovanni@archlinux.org>
# Contributor : Simon Sapin <simon dot sapin at exyr dot org>
# Contributor : Michal Marek <reqamst at gmail dot com>
# Contributor : Rick W. Chena <stuffcorpse@archlinux.us>
# Contributor : Andrea Fagiani <andfagiani _at_ gmail dot com>

pkgname=python-cssutils
_name="${pkgname#python-}"

pkgver=2.15.0
pkgrel=1
pkgdesc='CSS Cascading Style Sheets library for Python'
arch=('any')
url="https://github.com/jaraco/cssutils"
license=('LGPL-3.0-or-later')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
depends=(python python-encutils python-more-itertools)
checkdepends=('python-jaraco.test' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/c/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e9739237f3915037dacba787c4b58f280e3ec5d9864953e185bf23d40ff7d021')

prepare() {
  cd "$_name-$pkgver"
  sed -i '/coherent.licensed/d' pyproject.toml
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.rst NEWS.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  rm -rf examples/__pycache__
  cp -r examples "$pkgdir/usr/share/doc/$pkgname"
}

check(){
  cd "$_name-$pkgver"
  PYTHONPATH=. pytest
}

# vim: ts=2 sw=2 et ft=PKGBUILD:
