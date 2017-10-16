# Maintainer: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgbase=buildbot
pkgname=('buildbot' 'python-buildbot-www' 'buildbot-worker' 'python-buildbot-waterfall-view' 'python-buildbot-console-view' 'python-buildbot-grid-view' 'python-buildbot-wsgi-dashboards')
_names=('buildbot' 'buildbot_www' 'buildbot_worker' 'buildbot_waterfall_view' 'buildbot_console_view' 'buildbot_grid_view' 'buildbot_wsgi_dashboards')
pkgver=0.9.12
pkgrel=1
arch=('any')
url="http://buildbot.net"
license=("GPL")
makedepends=("python-pip")
source=(
  "https://files.pythonhosted.org/packages/py2.py3/${_names[0]::1}/${_names[0]}/${_names[0]}-$pkgver-py2.py3-none-any.whl"
  "https://files.pythonhosted.org/packages/py2.py3/${_names[1]::1}/${_names[1]}/${_names[1]}-$pkgver-py2.py3-none-any.whl"
  "https://files.pythonhosted.org/packages/py2.py3/${_names[2]::1}/${_names[2]}/${_names[2]}-$pkgver-py2.py3-none-any.whl"
  "https://files.pythonhosted.org/packages/py2.py3/${_names[3]::1}/${_names[3]}/${_names[3]}-$pkgver-py2.py3-none-any.whl"
  "https://files.pythonhosted.org/packages/py2.py3/${_names[4]::1}/${_names[4]}/${_names[4]}-$pkgver-py2.py3-none-any.whl"
  "https://files.pythonhosted.org/packages/py2.py3/${_names[5]::1}/${_names[5]}/${_names[5]}-$pkgver.post1-py2.py3-none-any.whl"
  "https://files.pythonhosted.org/packages/py2.py3/${_names[6]::1}/${_names[6]}/${_names[6]}-$pkgver-py2.py3-none-any.whl"
)
md5sums=(
  'bb82afa4d212cab439c8ca4c49e48a59'
  '5cc569201b2538f104e6724fc96f7746'
  '328ec0c2a24f5d2913bef4503f602df1'
  'a99a8c20369746e6edaacfe2ee46ef49'
  '1a87358a9205dcd725f153f70b659a5b'
  'a67b23a9b5d72fe617989f081acbf2b0'
  'c758b6e85620b81a5b51f4d9d7fc308e'
)

package_buildbot() {
  pkgdesc="The Continuous Integration Framework"
  depends=('python-twisted' 'python-jinja' 'python-migrate' 'python-dateutil' 'python-sqlparse' 'python-pyjwt' 'python-autobahn' 'python-txaio'
           'python-future' 'python-zope-interface' 'python-tempita'
           'python-distro')
  _name=${_names[0]}
  extraver=""
  install_whl
}

package_python-buildbot-www() {
  pkgdesc="Buildbot UI"
  depends=('buildbot')
  _name=${_names[1]}
  extraver=""
  install_whl
}

package_buildbot-worker() {
  pkgdesc="Buildbot Worker Daemon"
  depends=('python-twisted' 'python-future')
  _name=${_names[2]}
  extraver=""
  install_whl
}

package_python-buildbot-waterfall-view() {
  pkgdesc="Buildbot Waterfall View plugin"
  depends=('buildbot')
  _name=${_names[3]}
  extraver=""
  install_whl
}

package_python-buildbot-console-view() {
  pkgdesc="Buildbot Console View plugin"
  depends=('buildbot')
  _name=${_names[4]}
  extraver=""
  install_whl
}

package_python-buildbot-grid-view() {
  pkgdesc="Buildbot Grid View plugin"
  depends=('buildbot')
  _name=${_names[5]}
  extraver=".post1"
  install_whl
}

package_python-buildbot-wsgi-dashboards() {
  pkgdesc="Buildbot plugin to integrate flask or bottle dashboards to buildbot UI"
  depends=('buildbot')
  _name=${_names[6]}
  extraver=""
  install_whl
}

install_whl() {
  # install
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "${_name}-$pkgver$extraver-py2.py3-none-any.whl"
  # generate .pyo
  python -O -m compileall ${pkgdir}
}
