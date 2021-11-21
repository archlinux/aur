# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=gnome-next-meeting-applet
pkgver=1.5.0
pkgrel=1
pkgdesc="An applet to show your next meetings in Gnome or others"
arch=('any')
url="https://github.com/chmouel/gnome-next-meeting-applet"
license=('GPL3')
depends=('python-pytz' 'python-gobject' 'python-yaml' 'python-dateutil' 'python-tzlocal' 'libappindicator-gtk3' 'gnome-shell-extension-appindicator' 'evolution-data-server' 'gnome-online-accounts')
source=( https://github.com/chmouel/${pkgname}/archive/refs/tags/${pkgver}.tar.gz )
sha256sums=('403395908338ac962b357f5c096ac5d5323b299637476ccd8b8f324b48cd185a')

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
