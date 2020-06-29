# Maintainer: imtbl <imtbl at mser dot at>
pkgbase=ant-dracula-kde-theme-git
pkgname=(ant-dracula-kde-theme-git ant-dracula-kvantum-theme-git)
_pkgname=gtk
pkgver=v1.3.0.r57.g1eb71ee
pkgrel=1
pkgdesc="Ant Dracula theme for KDE Plasma"
arch=(any)
url="https://github.com/dracula/${_pkgname}"
license=('GPL3')
options=('!strip')
makedepends=('git')
source=("git+https://github.com/dracula/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_ant-dracula-kde-theme-git() {
  provides=('ant-dracula-kde-theme')
  optdepends=('ant-dracula-gtk-theme: Matching GTK theme'
              'ant-dracula-kvantum-theme-git: Ant Dracula theme for Kvantum Qt style (recommended)')

  cd "${_pkgname}/kde"

  mkdir -p "${pkgdir}/usr/share/aurorae/themes" "${pkgdir}/usr/share/sddm/themes"

  cp -r aurorae/* "${pkgdir}/usr/share/aurorae/themes"
  cp -r color-schemes "${pkgdir}/usr/share"
  cp -r plasma "${pkgdir}/usr/share"
  cp -r sddm/* "${pkgdir}/usr/share/sddm/themes"
}

package_ant-dracula-kvantum-theme-git() {
  provides=('ant-dracula-kvantum-theme')
  pkgdesc="Ant Dracula theme for Kvantum Qt style"
  depends=(kvantum-qt5)

  cd "${_pkgname}/kde"

  mkdir -p "${pkgdir}/usr/share/Kvantum"

  cp -r kvantum/* "${pkgdir}/usr/share/Kvantum"
}
