# Maintainer: Panda <sato.du@gmail.com>
# Template: 1.3.4 is filled in by packaging/aur/publish.sh and by the release workflow.
_pkgname=kde-webapp-manager
pkgname=${_pkgname}-git
pkgver=1.3.4
pkgrel=1
pkgdesc="A native Qt6 utility to easily generate and manage custom browser webapps on KDE Plasma"
arch=('any')
url="https://github.com/satodu/kde-webapp-gen"
license=('MIT')
depends=('python' 'python-pyqt6')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/satodu/kde-webapp-gen.git#tag=${pkgver}")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 main.py "${pkgdir}/usr/bin/${_pkgname}"

  install -d "${pkgdir}/usr/share/${_pkgname}"
  cp -r webapp_manager "${pkgdir}/usr/share/${_pkgname}/"
  find "${pkgdir}/usr/share/${_pkgname}/webapp_manager" -type d -exec chmod 755 {} +
  find "${pkgdir}/usr/share/${_pkgname}/webapp_manager" -type f -exec chmod 644 {} +

  install -Dm644 images/kde-webapp-gen-icon-logo.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 images/kde-webapp-gen-icon-logo.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

  install -d "${pkgdir}/usr/share/applications"
  cat <<EOF2 > "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=Webapp Manager
Comment=Create and edit webapps for KDE Plasma
Exec=${_pkgname}
Icon=/usr/share/pixmaps/${_pkgname}.png
Terminal=false
Categories=Utility;Settings;Qt;
StartupNotify=true
EOF2
}
