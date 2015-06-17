# $Id$
# Maintainer: José Luis Lafuente <jl@lafuente.me>
# Contributor: Arthur Vuillard <arthur@hashbang.fr>

pkgname='python-pew'
pkgver=0.1.14
pkgrel=1
pkgdesc="Python Env Wrapper, a set of tools to manage multiple virtual environments"
url="https://github.com/berdario/pew"
arch=('any')
license=('MIT')
depends=('python' 'python-virtualenv' 'python-virtualenv-clone')
makedepends=('python' 'python-setuptools')
replaces=('pew')
conflicts=('pew')
source=("https://pypi.python.org/packages/source/p/pew/pew-$pkgver.tar.gz")

package() {
  cd "$srcdir/pew-$pkgver"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="$pkgdir"

  # link to a version with 3 suffix as well
  ln "$pkgdir/usr/bin/pew" "$pkgdir/usr/bin/pew3"

  install -D -m644 pew/complete_scripts/complete.fish \
    "$pkgdir/usr/share/fish/completions/pew.fish"

  install -D -m644 pew/complete_scripts/complete.bash \
    "$pkgdir/usr/share/bash-completion/completions/pew"

  install -D -m644 pew/complete_scripts/complete.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_pew"

  # Some files are not really necessary.
  #py_dir=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
  #rm -r "${pkgdir}${py_dir}/pew/complete_scripts"
}

md5sums=('0a06ab0885b39f1ef3890893942f3225')

# vim:set ts=2 sw=2 et:
