# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Martin Corley <Martin.Corley@ed.ac.uk>

pkgname=psychopy
pkgver=2020.1.3
pkgrel=3
pkgdesc="An experiment builder for neuroscience, psychology and psychophysics"
arch=('any')
url="http://www.psychopy.org"
license=('GPL3')
makedepends=(python-wheel python-setuptools)
depends=(python-requests python-numpy python-scipy python-matplotlib python-pandas python-pillow python-glfw python-opengl python-sounddevice python-soundfile python-bidi python-arabic-reshaper python-future python-json-tricks python-pyosf python-xlrd python-openpyxl python-pyserial python-pyaml python-gevent python-msgpack python-msgpack-numpy python-psutil python-pytables python-pyzmq python-moviepy python-opencv-python python-gitlab python-gitpython python-astunparse python-esprima python-freetype-py python-javascripthon python-pyglet python-questplus python-imageio python-imageio-ffmpeg python-pyparallel python-pyqt5 python-wxpython python-distro python-psychtoolbox python-cryptography python-pyopenssl webkit2gtk)

optdepends=('python-seaborn: For nice graphs')
source=("https://github.com/psychopy/psychopy/archive/${pkgver}.tar.gz")
sha512sums=('ef0d510b8f1ca739ae74f1da8d04b234665703cb29f0faebd04d171c9330aac7b2879a53142981bb4fc3bdecc95e7ccbdf80d94a687ee511e195942d1e3b94cf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  rm -rf packaging/
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
