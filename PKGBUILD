# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=gnome-next-meeting-applet
pkgver=1.1.0
pkgrel=1
pkgdesc="An applet to show your next meetings in Gnome or others"
arch=('any')
url="https://github.com/chmouel/gnome-next-meeting-applet"
license=('GPL3')
depends=('python-pytz' 'python-gobject' 'python-yaml' 'python-dateutil' 'python-tzlocal' 'libappindicator-gtk3' 'gnome-shell-extension-appindicator' 'evolution-data-server' 'gnome-online-accounts')
source=( https://github.com/chmouel/${pkgname}/archive/refs/tags/${pkgver}.tar.gz )
sha256sums=('1699ea0fbf9a668b63e4c6c7a33510528729d275d6613f06de3e35b44239561a')

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
