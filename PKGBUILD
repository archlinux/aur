# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=gnome-next-meeting-applet
pkgver=2.2.0
pkgrel=1
pkgdesc="An applet to show your next meetings from Gnome Online Accounts"
arch=('any')
url="https://github.com/chmouel/gnome-next-meeting-applet"
license=('GPL3')
depends=('python-gobject' 'python-yaml' 'python-humanize' 'libappindicator-gtk3' 'gnome-shell-extension-appindicator' 'evolution-data-server' 'evolution-data-server' 'python-dateutil' 'python-dbus')
source=( https://github.com/chmouel/${pkgname}/archive/refs/tags/${pkgver}.tar.gz )
sha256sums=('336f50f17e18edac6980fb9c0dce0af9eb0b92c68cf1bba76c090d755f153dd8')
makedepends=("python-setuptools" "python-dephell")

prepare() {
    cd "$pkgname-$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py build
}

package() { 
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py -q install --root="${pkgdir}" --optimize=1
  mkdir -p ${pkgdir}/usr/share/{${pkgname},applications,icons/hicolor/scalable/apps}
  cp -a data/images ${pkgdir}/usr/share/${pkgname}/
  cp data/desktop/${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -m0644 -D data/desktop/icon.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg
}
