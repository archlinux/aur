# $Id$
# Maintainer: José Luis Lafuente <jl@lafuente.me>
# Contributor: Arthur Vuillard <arthur@hashbang.fr>

pkgname='python-pew'
pkgver=0.1.15
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

_scripts_path='pew/shell_config'

package() {
  cd "$srcdir/pew-$pkgver"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="$pkgdir"

  # link to a version with 3 suffix as well
  ln "$pkgdir/usr/bin/pew" "$pkgdir/usr/bin/pew3"

  install -D -m644 $_scripts_path/complete.fish \
    "$pkgdir/usr/share/fish/completions/pew.fish"

  install -D -m644 $_scripts_path/complete.bash \
    "$pkgdir/usr/share/bash-completion/completions/pew"

  install -D -m644 $_scripts_path/complete.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_pew"

  # Some files are not really necessary.
  #py_dir=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
  #rm -r "${pkgdir}${py_dir}/pew/complete_scripts"
}

md5sums=('d49cc1e3ad45457055a13ac14b83a9be')

# vim:set ts=2 sw=2 et:
