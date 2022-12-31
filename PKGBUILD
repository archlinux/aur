# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=dockbarx
pkgname=${_pkgname}-git
epoch=1
_pkgver=1.0beta
pkgver=1.0beta2+0+g38af1e8
pkgrel=1
pkgdesc="TaskBar with groupping and group manipulation"
arch=('i688' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/M7S/dockbarx"
license=('GPL3')
depends=('libkeybinder3' 'python-cairo' 'dbus-python' 'python-gobject' 'python-pillow'
         'python-xlib' 'python-xdg')
makedepends=('python-setuptools' 'python-polib' 'git')
optdepends=('mate-panel: mate applet'
            'zeitgeist: recently used file list'
            'xfce4-dockbarx-plugin>=0.6: xfce4-panel plugin'
            'python-pyudev: dockx battery applet'
            'gconf: export settings from older versions of dockbarx'
            'python-lxml: import settings script')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
_branch='pygi-python3'
source=("${_pkgname}::git+https://github.com/xuzhen/dockbarx.git#branch=${_branch}")
sha256sums=('SKIP')
install="${_pkgname}.install"

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's:-beta:beta:;s:-:+:g'
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root "${pkgdir}" --optimize=1

  install -Dm644 "${srcdir}/${_pkgname}"/icons/hicolor/128x128/apps/dockbarx.png "${pkgdir}"/usr/share/pixmaps/dockbarx.png
}
