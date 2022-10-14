# Maintainer : Guillaume Horel <guillaume dot horel at gmail dot com>
# Contributor :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Contributor : Giovanni Scafora <giovanni@archlinux.org>
# Contributor : Simon Sapin <simon dot sapin at exyr dot org>
# Contributor : Michal Marek <reqamst at gmail dot com>
# Contributor : Rick W. Chena <stuffcorpse@archlinux.us>
# Contributor : Andrea Fagiani <andfagiani _at_ gmail dot com>


pkgname=python-cssutils
_name="${pkgname#python-}"

pkgver=2.6.0
pkgrel=1

pkgdesc='CSS Cascading Style Sheets library for Python'
arch=('any')
url="https://github.com/jaraco/$_name"
license=('LGPL3' 'GPL3')

makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-toml' 'python-wheel')
depends=('python')
checkdepends=('python-jaraco.test' 'python-mock' 'python-pytest')

changelog=CHANGES.rst
source=("https://files.pythonhosted.org/packages/source/c/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f7dcd23c1cec909fdf3630de346e1413b7b2555936dec14ba2ebb9913bf0818e')


build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 examples/* -t "$pkgdir/usr/share/doc/$pkgname/examples/"
}

check(){
  cd "$_name-$pkgver"
  pytest cssutils/tests 
}

# vim: ts=2 sw=2 et ft=PKGBUILD:
