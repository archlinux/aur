# Contributor: L. Wang <xia0er__AT__gmail.com> 
pkgname=python2-pymc-git
pkgver=20131228
pkgrel=1
pkgdesc="Markov chain Monte Carlo for Python"
arch=('i686' 'x86_64')
url="https://github.com/pymc-devs/pymc"
license=('MIT')
source=()
md5sums=()

_gitroot=https://github.com/pymc-devs/pymc
_gitname=pymc

build() {
  cd $srcdir

  msg "Checking out source from github.com..."

  if [ -d $_gitname ]; then
	  cd $_gitname && git pull origin
	  msg "The local files are updated."
  else
          git clone $_gitroot
          cd $_gitname
  fi
}

package() {
  depends=('python2-numpy>=1.7.1' 'python2-scipy>=0.12.0' 'python2-matplotlib>=1.2.1' "python2-theano>=0.6.0rc3" "python2-patsy" "python2-statsmodels" "python2-pandas")
  optdepends=('scikits-base')
  conflicts=('python2-pymc')

  cd $srcdir/$_gitname
  export LDFLAGS="$LDFLAGS -nostartfiles -g"
  python2 setup.py build
  python2 setup.py install --prefix=/usr --root=$pkgdir || return 1
}

package_python-pymc() {
  depends=('python-numpy>=1.7.1' 'python-scipy>=0.12.0' 'python-matplotlib>=1.2.1' "python-theano>=0.6.0rc3" "python-patsy" "python-statsmodels" "python-pandas")
  optdepends=('scikits-base')
  conflicts=('python-pymc')

  cd $srcdir/$_gitname
  export LDFLAGS="$LDFLAGS -nostartfiles -g"
  python setup.py build
  python setup.py install --prefix=/usr --root=$pkgdir || return 1
}

