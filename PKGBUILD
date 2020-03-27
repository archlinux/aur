# Maintainer: willemw <willemw12@gmail.com>

_pkgname=spyder3
pkgbase=spyder-git
pkgname=$_pkgname-git
pkgver=4.1.1.r279.g93646f330
pkgrel=1
pkgdesc="The Scientific Python Development Environment (Python 3 version)"
arch=('any')
url="https://www.spyder-ide.org/"
license=('MIT')
makedepends=('git' 'python-setuptools' 'python-sphinx')
#'icu'
depends=('jupyter-nbconvert'
         'python-atomicwrites'
         'python-chardet'
         'python-cloudpickle'
         'python-diff-match-patch'
         'python-intervaltree'
         'python-jedi'
         'python-keyring'
         'python-language-server'
         'python-numpydoc'
         'python-paramiko'
         'python-parso'
         'python-pexpect'
         'python-pickleshare'
         'python-psutil'
         'python-pycodestyle'
         'python-pyflakes'
         'python-pygments'
         'python-pylint'
         'python-pympler'
         'python-pyqt5'
         'python-pyzmq'
         'python-qdarkstyle'
         'python-qtawesome'
         'python-qtconsole'
         'python-rope'
         'python-sphinx'
         'python-spyder-kernels'
         'python-watchdog'
         'python-xdg')
#'pyside2: Qt-Python bindings'
optdepends=('cython: run Cython files'
            'python-matplotlib: 2D/3D plotting'
            'python-numpy: N-dimensional arrays'
            'python-pandas: DataFrame and Series support'
            'python-scipy: signal/image processing'
            'python-sympy: symbolic mathematics'

            'python-h5py: HDF5 support')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git+https://github.com/spyder-ide/spyder.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
} 

prepare() {
  find $pkgname -type f -iname \*.py -exec sed -i -e 's|"pep8"|"pycodestyle"|g' -e "s|'pep8'|'pycodestyle'|g" '{}' \;
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE.txt"
  # Install a scalable icon for the spyder3.desktop file
  install -Dm644 spyder/images/spyder.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/spyder3.svg"

  rm -f "$pkgdir/usr/bin/spyder_win_post_install.py"
}

