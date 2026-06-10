# Maintainer: Panda <satodu>
_pkgname=kde-webapp-manager
pkgname=${_pkgname}-git
pkgver=r9.ge0f97a9
pkgrel=1
pkgdesc="A native Qt6 utility to easily generate and manage custom browser webapps on KDE Plasma"
arch=('any')
url="https://github.com/satodu/kde-webapp-gen"
license=('MIT')
depends=('python' 'python-pyqt6')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/satodu/kde-webapp-gen.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  
  # Install the executable script
  install -Dm755 main.py "${pkgdir}/usr/bin/${_pkgname}"
  
  # Install custom logo icon to pixmaps (standard for standalone icons)
  install -Dm644 images/kde-webapp-gen-icon-logo.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  
  # Install desktop entry shortcut
  install -d "${pkgdir}/usr/share/applications"
  cat <<EOF > "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=Webapp Manager
Comment=Create and edit webapps for KDE Plasma
Exec=${_pkgname}
Icon=${_pkgname}
Terminal=false
Categories=Utility;Settings;Qt;
StartupNotify=true
EOF
}
