# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=gnome-next-meeting-applet
pkgver=2.0.1
pkgrel=1
pkgdesc="An applet to show your next meetings in Gnome or others"
arch=('any')
url="https://github.com/chmouel/gnome-next-meeting-applet"
license=('GPL3')
depends=('python-pytz' 'python-gobject' 'python-yaml' 'python-dateutil' 'python-tzlocal' 'libappindicator-gtk3' 'gnome-shell-extension-appindicator' 'evolution-data-server' 'gnome-online-accounts')
source=( https://github.com/chmouel/${pkgname}/archive/refs/tags/${pkgver}.tar.gz )
sha256sums=('25d3593e42683336f3683d4ff29abf4b5409e5d730d9da49dc1fad7eb2548292')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py build
}

package() { 
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py -q install --root="${pkgdir}" --optimize=1
  mkdir -p ${pkgdir}/usr/share/{${pkgname},applications,icons}
  mv ${pkgdir}/usr/images ${pkgdir}/usr/share/${pkgname}
  cp packaging/${pkgname}.desktop ${pkgdir}/usr/share/applications/
  cp images/icon.svg ${pkgdir}/usr/share/icons/${pkgname}.svg
}
