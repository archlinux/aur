# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python2-wxpython4
pkgver=4.0.1
pkgrel=1
pkgdesc="Phoenix wxWidgets GUI toolkit for Python 2"
_name=wxPython
arch=('any')
url="https://github.com/wxWidgets/Phoenix"
license=('custom:wxWindows')
groups=()
depends=('python')
makedepends=('python2-setuptools' 'python2-appdirs' 'python2-six' 'twine' 'python2-sphinx' 'python2-requests' 'python2-pytest' 'python2-pytest-xdist' 'python2-pytest-timeout' 'python2-numpy' 'mesa' 'glu' 'git' 'libpng' 'libjpeg-turbo' 'libtiff' 'sdl' 'gst-plugins-base' 'libnotify' 'freeglut' 'gtk3' 'webkit2gtk')
provides=('python2-wxpython')
conflicts=('python2-wxpython-phoenix' 'sk1' 'wammu')
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f8f2ac1a75368b9b103259addc77f4e3dfe729c6d70aa1fd0b7e9c5b6075c710')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  # We have to rename the files in /usr/bin to avoid conflicts with python2 wxPython
  # I've used the naming convention established in wxpython-phoenix-git
  cd "$pkgdir/usr/bin"
  for file in *; do mv ${file} ${file}-phoenix2; done
  chmod 644 "$pkgdir"/usr/lib/python2.7/site-packages/wxPython-4.0.1-py2.7.egg-info/*
}

# vim:set ts=2 sw=2 et:
