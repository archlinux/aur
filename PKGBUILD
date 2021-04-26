# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Contributor : Giovanni Scafora <giovanni@archlinux.org>
# Contributor : Simon Sapin <simon dot sapin at exyr dot org>
# Contributor : Michal Marek <reqamst at gmail dot com>
# Contributor : Rick W. Chena <stuffcorpse@archlinux.us>
# Contributor : Andrea Fagiani <andfagiani _at_ gmail dot com>


pkgname=python-cssutils
_name="${pkgname#python-}"

pkgver=2.2.0
pkgrel=1

pkgdesc='CSS Cascading Style Sheets library for Python'
arch=('any')
url="https://github.com/jaraco/$_name"
license=('LGPL3' 'GPL3')

makedepends=('python-setuptools' 'python-wheel' 'python-pip')
depends=('python')

changelog=CHANGES.rst
source=("https://files.pythonhosted.org/packages/source/c/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5bef59f6b59bdccbea8e36cb292d2be1b6be1b485fc4a9f5886616f19eb31aaf')


prepare() {
  cd "$_name-$pkgver"
  find . -name __init__.py -exec sed -i 's/w\(indows-1252\)/W\1/g' \{\} \;
}

build() {
  cd "$_name-$pkgver"
  2to3 --no-diffs -nw "$_name"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 README.rst -t"$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 examples/* -t"$pkgdir/usr/share/doc/$pkgname/examples/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
