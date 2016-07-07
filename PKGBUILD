# $Id$
# Maintainer: José Luis Lafuente <jl@lafuente.me>
# Contributor: Arthur Vuillard <arthur@hashbang.fr>

pkgname='python-pew'
pkgver=0.1.20
pkgrel=1
pkgdesc="Python Env Wrapper, a set of tools to manage multiple virtual environments"
url="https://github.com/berdario/pew"
arch=('any')
license=('MIT')
depends=('python' 'python-virtualenv' 'python-virtualenv-clone' 'python-pythonz-bd')
makedepends=('python' 'python-setuptools')
replaces=('pew')
conflicts=('pew')
source=("https://github.com/berdario/pew/archive/$pkgver.zip")

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
}

md5sums=('282dd0d9630e648052470dac0f556637')

# vim:set ts=2 sw=2 et:
