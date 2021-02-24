# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Martin Corley <Martin.Corley@ed.ac.uk>

pkgname=psychopy
pkgver=2021.1.0
pkgrel=1
pkgdesc="An experiment builder for neuroscience, psychology and psychophysics"
arch=('any')
url="http://www.psychopy.org"
license=('GPL3')
makedepends=(python-setuptools)
depends=(python-requests python-numpy python-scipy python-matplotlib python-pandas python-pillow python-glfw python-opengl python-sounddevice python-soundfile python-bidi python-arabic-reshaper python-future python-json-tricks python-pyosf python-xlrd python-openpyxl python-pyserial python-pyaml python-gevent python-msgpack python-msgpack-numpy python-psutil python-pytables python-pyzmq python-moviepy opencv python-gitlab python-gitpython python-astunparse python-esprima python-freetype-py python-javascripthon python-pyglet python-questplus python-imageio python-imageio-ffmpeg python-pyparallel python-pyqt5 python-wxpython python-distro python-psychtoolbox python-cryptography python-pyopenssl webkit2gtk python-xlib python-pyglet python-websocket-client python-jedi python-vlc python-ujson)

optdepends=('python-seaborn: For nice graphs')
source=("https://github.com/psychopy/psychopy/archive/${pkgver}.tar.gz")
sha512sums=('ac0504779a3cfa8e51f6b641fb6c1453b790fed0c924a0bab9d9fba91ddfd1cd0ffadf52cf5e7f1b73bbf394aee43fb213cf472664d9e671adacf2cb27923fd7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  rm -rf packaging/
  sed -i '/opencv-python/d' setup.cfg
  sed -i '/pyglet/d'  setup.cfg
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
