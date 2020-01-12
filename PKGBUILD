# Maintainer: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Daniel E. Shub <daniel.e.shub@gmail.com>
# Contributor: Martin Corley <Martin.Corley@ed.ac.uk>

pkgname=psychopy
pkgver=3.2.4
pkgrel=1
pkgdesc="An experiment builder for neuroscience, psychology and psychophysics"
arch=('any')
url="http://www.psychopy.org"
license=('GPL3')
depends=('python-matplotlib' 'python-pandas' 'python-opengl' 'python-pyglet'
         'python-moviepy' 'python-lxml' 'python-openpyxl' 'python-configobj'
         'python-freetype-py' 'python-gitpython' 'python-gitlab' 'python-pyzmq'
         'python-json-tricks' 'python-pygame' 'python-pyqt5' 'python-imageio-ffmpeg'
         'python-soundfile' 'python-sounddevice' 'python-pytables' 'python-msgpack-numpy'
         'python-gevent' 'python-pyaml' 'python-cryptography' 'python-pyopenssl'
         'python-xlrd' 'python-pyosf' 'python-bidi' 'python-esprima'
         'python-pyparallel' 'python-psutil' 'python-astunparse' 'python-pyserial'
         'python-arabic-reshaper' 'python-wxpython' 'webkit2gtk' 'python-mock' 'opencv')
makedepends=('python-wheel' 'python-setuptools')
optdepends=('python-seaborn: For nice graphs')
source=("https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('084f8715193d5c6ac836e012a7f082cd027e5ed14a4c08d1ad7db85749df8cec015ded828c32a36f999b5cec51f6d221812f94a21043e5e08d68c5c78b09d6f9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # desktop files
  cd "$pkgname/app/Resources"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.xml" "$pkgdir/usr/share/mime/packages/$pkgname.xml"
}

# vim:set ts=2 sw=2 et:
