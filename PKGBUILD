# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>
# Contributor: Martin Corley <Martin.Corley@ed.ac.uk>

pkgname=psychopy
pkgver=1.82.02
pkgrel=1
pkgdesc="An experiment builder for neuroscience, psychology and psychophysics"
arch=(any)
url="http://www.psychopy.org"
license=(GPL)
makedepends=('python2-setuptools')
depends=('python2' 'wxpython' 'python2-numpy' 'python2-pandas' 'python2-scipy' 'python2-imaging' 'python2-lxml' 'python2-pyglet' 'python2-matplotlib' 'glu' 'python2-pyo' 'python2-opengl' 'python2-pygame' 'avbin7' 'python2-openpyxl' 'ttf-freefont' 'python2-psutil' 'python2-yaml' 'python2-gevent' 'python2-msgpack' 'python2-xlib')

optdepends=(
'python2-pyparallel: To use the parallel port'
'python2-pyserial: For interfacing with the serial port'
'parallel-python: For parallel processing'
'flac: For working with google speech'
'python2-pytest: For running unit tests'
'python2-coverage: For running unit tests'
'python2-sphinx: For building documentation'
)

options=(!emptydirs)
source=("http://downloads.sourceforge.net/project/psychpy/PsychoPy/PsychoPy-${pkgver}.zip")
md5sums=('52309280bdca4408970aab0952c674e4')


prepare() {
  sed -i 's/py.test /py.test2 /' "${srcdir}/PsychoPy-${pkgver}/${pkgname}/tests/run.py"
}

package() {
  (cd "${srcdir}/PsychoPy-${pkgver}"; python2 setup.py install --root="${pkgdir}/" --optimize=1)
  install -m 755 "${srcdir}/PsychoPy-${pkgver}/${pkgname}/app/psychopyApp.py" "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/PsychoPy-${pkgver}/${pkgname}/app/Resources/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/PsychoPy-${pkgver}/${pkgname}/app/Resources/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
