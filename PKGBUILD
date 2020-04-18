# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Daniel E. Shub <daniel.e.shub@gmail.com>
# Contributor: Martin Corley <Martin.Corley@ed.ac.uk>

pkgname=psychopy
pkgver=2020.1.3
pkgrel=2
pkgdesc="An experiment builder for neuroscience, psychology and psychophysics"
arch=('any')
url="http://www.psychopy.org"
license=('GPL-3.0')
depends=('python-matplotlib' 'python-pandas' 'python-opengl' 'python-pyglet'
         'python-moviepy' 'python-lxml' 'python-openpyxl' 'python-configobj'
         'python-freetype-py' 'python-gitpython' 'python-gitlab' 'python-pyzmq'
         'python-json-tricks' 'python-pygame' 'python-pyqt5' 'python-imageio-ffmpeg'
         'python-soundfile' 'python-sounddevice' 'python-pytables' 'python-msgpack-numpy'
         'python-gevent' 'python-pyaml' 'python-cryptography' 'python-pyopenssl'
         'python-xlrd' 'python-pyosf' 'python-bidi' 'python-esprima'
         'python-pyparallel' 'python-psutil' 'python-astunparse' 'python-pyserial'
         'python-arabic-reshaper' 'python-wxpython' 'webkit2gtk' 'python-mock' 'opencv'
         'python-questplus' 'python-opencv-python' 'python-glfw')
makedepends=('python-wheel' 'python-setuptools')
optdepends=('python-seaborn: For nice graphs')
source=("https://github.com/psychopy/psychopy/archive/${pkgver}.tar.gz")
sha512sums=('ef0d510b8f1ca739ae74f1da8d04b234665703cb29f0faebd04d171c9330aac7b2879a53142981bb4fc3bdecc95e7ccbdf80d94a687ee511e195942d1e3b94cf')

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