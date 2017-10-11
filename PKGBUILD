# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=wxpython-phoenix
pkgver=4.0.0b2
pkgrel=1
pkgdesc="Python 3 implementation of wxPython"
_name=wxPython
arch=('any')
url="https://github.com/wxWidgets/Phoenix"
license=('custom:wxWindows')
groups=()
depends=('python')
makedepends=('mesa' 'glu' 'git' 'libpng' 'libjpeg-turbo' 'libtiff' 'sdl' 'gst-plugins-base' 'libnotify' 'freeglut' 'gtk3' 'webkit2gtk')
provides=('wxpython-phoenix')
conflicts=('wxpython-phoenix-bin' 'wxpython-phoenix-git')
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1d34c3e2ff475ca6d2a11e8addd0333e4f616cc74f6bfcda5c6e96f51478666d')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  # We have to rename the files in /usr/bin to avoid conflicts with python2 wxPython
  # I've used the naming convention established in wxpython-phoenix-git
  cd "$pkgdir/usr/bin"
  for file in *; do mv ${file} ${file}-phoenix; done
  chmod 644 "$pkgdir"/usr/lib/python3.6/site-packages/wxPython-4.0.0b2-py3.6.egg-info/*
}

# vim:set ts=2 sw=2 et:
