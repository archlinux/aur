# Maintainer: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgbase=buildbot
pkgname=('buildbot' 'python-buildbot-www' 'buildbot-worker' 'python-buildbot-waterfall-view' 'python-buildbot-console-view')
_names=('buildbot' 'buildbot_www' 'buildbot_worker' 'buildbot_waterfall_view' 'buildbot_console_view')
pkgver=0.9.5
pkgrel=1
arch=('any')
url="http://buildbot.net"
license=("GPL")
source=(
  "https://files.pythonhosted.org/packages/py2.py3/${_names[0]::1}/${_names[0]}/${_names[0]}-$pkgver-py2.py3-none-any.whl"
  "https://files.pythonhosted.org/packages/py2.py3/${_names[1]::1}/${_names[1]}/${_names[1]}-$pkgver-py2.py3-none-any.whl"
  "https://files.pythonhosted.org/packages/py2.py3/${_names[2]::1}/${_names[2]}/${_names[2]}-$pkgver-py2.py3-none-any.whl"
  "https://files.pythonhosted.org/packages/py2.py3/${_names[3]::1}/${_names[3]}/${_names[3]}-$pkgver-py2.py3-none-any.whl"
  "https://files.pythonhosted.org/packages/py2.py3/${_names[4]::1}/${_names[4]}/${_names[4]}-$pkgver-py2.py3-none-any.whl"
)
md5sums=(
  '0ae7989f497d21d78dcadc2f360934bb'
  'fbe69f0f3c62a2d564511093e91c4e96'
  'cc1c0b5b35ac22bdc3b7b63cff28f7c9'
  '3f008d1051f8b6c3d621056cb99d67e5'
  '5e1375648c2398d277ccffaea7473fa8'
)

package_buildbot() {
  pkgdesc="The Continuous Integration Framework"
  depends=('python-twisted' 'python-jinja' 'python-migrate' 'python-dateutil' 'python-sqlparse' 'python-pyjwt' 'python-autobahn' 'python-txaio'
           'python-future' 'python-zope-interface' 'python-tempita'
           'python-distro')
  _name=${_names[0]}
  install_whl
}

package_python-buildbot-www() {
  pkgdesc="Buildbot UI"
  depends=('buildbot')
  _name=${_names[1]}
  install_whl
}

package_buildbot-worker() {
  pkgdesc="Buildbot Worker Daemon"
  depends=('python-twisted' 'python-future')
  _name=${_names[2]}
  install_whl
}

package_python-buildbot-waterfall-view() {
  pkgdesc="Buildbot Waterfall View plugin"
  depends=('buildbot')
  _name=${_names[3]}
  install_whl
}

package_python-buildbot-console-view() {
  pkgdesc="Buildbot Console View plugin"
  depends=('buildbot')
  _name=${_names[4]}
  install_whl
}

install_whl() {
  # install
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "${_name}-$pkgver-py2.py3-none-any.whl"
  # generate .pyo
  python -O -m compileall ${pkgdir}
}