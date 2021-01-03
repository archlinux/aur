# Maintainer: Tom Wadley <tom@tomwadley.net>

pkgname=buildnotify-git
pkgver=2.1.0.r0.g1b03860
pkgrel=1
pkgdesc="A system tray based build status notification app for cctray.xml feeds"
arch=('any')
url="https://github.com/anaynayak/buildnotify"
license=('GPL3')
depends=('python' 'python-pytz' 'python-pyqt5' 'python-dateutil' 'python-requests')
optdepends=('python-keyring: keyring support')
makedepends=('git' 'python-setuptools')
conflicts=('buildnotify' 'buildnotify-hg')
provides=('buildnotify')
replaces=('buildnotify-hg')
source=("git+$url")
sha256sums=('SKIP')

_installmodule() {
  pushd "${srcdir}/buildnotify"
  /usr/bin/python3 setup.py install --root="${pkgdir}/" --optimize=1
  popd
}

pkgver() {
  cd "${srcdir}/buildnotify"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  _installmodule

  cd "${srcdir}/buildnotify"

  install -D -m 644 buildnotify.desktop "${pkgdir}/usr/share/applications/buildnotify.desktop"
  install -D -m 644 buildnotify.svg "${pkgdir}/usr/share/pixmaps/buildnotify.svg"
}

# vim:set ts=2 sw=2 et:
