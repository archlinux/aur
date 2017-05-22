# Maintainer: Gabriel "ArcturusB" Perouze" <arcturus@openmailbox.org>

pkgname=chiantipy-git
_gitname=ChiantiPy
pkgver=0.7.dev
pkgrel=1
pkgdesc="A python package to calculate the radiative properties of astrophysical plasmas based on the CHIANTI atomic database"
arch=('i686' 'x86_64')
url="https://github.com/chianti-atomic/ChiantiPy"
license=('ISC')
depends=('python'
         'python-numpy'
         'python-scipy'
         'python-matplotlib'
         'ipython-ipyparallel')
optdepends=('ipython: interactive terminal'
            'python-pyqt4: GUI'
            'wxpython: GUI alternative')
makedepends=('git')
provides=(chiantipy)
conflicts=(chiantipy)
options=(!emptydirs)
install=
source=(git+https://github.com/chianti-atomic/ChiantiPy.git)
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "%s%s" "$(grep "VERSION = " setup.py | cut -d\' -f2)" "$(git rev-list --count HEAD)"
}

package() {
  cd "${_gitname}"
  git submodule update --init
  python setup.py install --root="${pkgdir}"
}

post_install() {
  echo "In order to use ChiantiPy, download the CHIANTI database:"
  echo "  http://www.chiantidatabase.org/chianti_download.html"
  echo "Assuming you've placed the CHIANTI tree in $HOME, set the environment"
  echo "variable in your .bashrc file:"
  echo "  export XUVTOP=$HOME/chianti/dbase"
}

# vim:set ts=2 sw=2 et:
