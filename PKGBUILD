# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgbase=('python-wxpython-phoenix')
pkgname=('python-wxpython-phoenix' 'python2-wxpython-phoenix')
pkgver=4.0.1
pkgrel=2
pkgdesc="wxPython 4.x. This is a split package providing both Python 2 and Python 3 versions of wxPython 4.x (aka wxPython Phoenix)"
_name=wxPython
arch=('any')
url="https://github.com/wxWidgets/Phoenix"
license=('custom:wxWindows')
groups=()
depends=('python')
makedepends=('python-setuptools' 'python2-setuptools' 'python-appdirs' 'python2-appdirs' 'python-six' 'python2-six' 'twine' 'python-sphinx' 'python2-sphinx' 'python-requests' 'python2-requests' 'python-pytest' 'python2-pytest' 'python-pytest-xdist' 'python2-pytest-xdist' 'python-pytest-timeout' 'python2-pytest-timeout' 'python-numpy' 'python2-numpy' 'mesa' 'glu' 'git' 'libpng' 'libjpeg-turbo' 'libtiff' 'sdl' 'gst-plugins-base' 'libnotify' 'freeglut' 'gtk3' 'webkit2gtk')
provides=('wxpython-phoenix' 'python-wxpython')
conflicts=('python-wxpython' 'wxpython-phoenix-bin' 'wxpython-phoenix-git' 'sk1' 'wammu')
replaces=('wxpython-phoenix')
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f8f2ac1a75368b9b103259addc77f4e3dfe729c6d70aa1fd0b7e9c5b6075c710')

package_python-wxpython-phoenix() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  # We have to rename the files in /usr/bin to avoid conflicts with python2 wxPython
  # I've used the naming convention established in wxpython-phoenix-git
  cd "$pkgdir/usr/bin"
  for file in *; do mv ${file} ${file}-phoenix; done
  chmod 644 "$pkgdir"/usr/lib/python3.6/site-packages/wxPython-4.0.1-py3.6.egg-info/*
}

package_python2-wxpython-phoenix() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  # We have to rename the files in /usr/bin to avoid conflicts with python2 wxPython
  # I've used the naming convention established in wxpython-phoenix-git
  cd "$pkgdir/usr/bin"
  for file in *; do mv ${file} ${file}-phoenix2; done
  chmod 644 "$pkgdir"/usr/lib/python2.7/site-packages/wxPython-4.0.1-py2.7.egg-info/*
} 

# vim:set ts=2 sw=2 et:
