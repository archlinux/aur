# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=dockbarx
pkgname=${_pkgname}-git
epoch=2
_pkgver=1.0beta
pkgver=1.0beta4+0+g3c5e6b3
pkgrel=1
pkgdesc="TaskBar with grouping and group manipulation"
arch=('any')
url="https://github.com/xuzhen/dockbarx"
license=('GPL-3.0-or-later')
depends=('libkeybinder3' 'python-cairo' 'dbus-python' 'python-gobject' 'python-pillow'
         'python-xlib' 'python-pyxdg')
makedepends=('python-setuptools' 'python-installer' 'python-build' 'python-wheel' 'python-polib' 'git')
optdepends=('dockbarx-mate-applet: mate applet'
            'dockbarx-lxqt-plugin: lxqt applet'
            'xfce4-dockbarx-plugin: xfce4-panel plugin'
            'zeitgeist: recently used file list'
            'python-pyudev: dockx battery applet'
            'gconf: export settings from older versions of dockbarx'
            'python-lxml: import settings script')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
_branch='pygi-python3'
source=("${_pkgname}::git+${url}.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's:-beta:beta:;s:-:+:g'
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}
package() {
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  install -Dm644 "${srcdir}/${_pkgname}"/data/icons/hicolor/128x128/apps/dockbarx.png "${pkgdir}"/usr/share/pixmaps/dockbarx.png
}
