# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>
pkgname=sfs-select
pkgver=0.5.0
pkgrel=2
pkgdesc="A small tool to manage Steam Family Sharing"
arch=('any')
url="https://www.unix-ag.uni-kl.de/~t_schmid/sfs-select/"
license=('GPL3')
depends=('steam' 'python>=3.0' 'python-pyqt5' 'python-psutil')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://www.unix-ag.uni-kl.de/~t_schmid/sfs-select/sfs-select-$pkgver-full.7z"
        "setup.py"
        "01-packageify.patch"
        "02-config.patch")
sha256sums=('02e6daaca0bcf66649bb24ededaa8cf21dcf9e4271fcb59857298fc176d2138c'
            'c362a7bf3081db65afa0300474a8f3899b95552d2848e42800095a8c33ceaa39'
            '4516e47bf39c6046fd50ecf2d6dd82ab5672f4434b42483770505f568fdeac9b'
            'ee34b9d7ab390a259ad71dce955af65d058173a4ef25ded3922896ced9caf9a2')

prepare() {
  cd "$srcdir"
  rm -rf sfs_select
  mkdir sfs_select
  cp sfs-select/python/{*.py,*.ui} sfs_select

  patch -Np0 -i 01-packageify.patch
  patch -Np0 -i 02-config.patch

  mv sfs_select/{sfs-select.py,__init__.py}
  chmod -x sfs_select/__init__.py
}

package() {
  cd "$srcdir"
  ./setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et ft=sh:
