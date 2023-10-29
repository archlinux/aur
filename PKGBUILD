# Maintainer: Pierce Thompson <pierce at insprill dot net>

pkgbase=plasma5-themes-dracula-git
pkgname=("plasma5-themes-dracula-git" "kvantum-theme-dracula-git")
_pkgname=gtk
pkgver=v4.0.0.r30.g3e56ce3
pkgrel=1
pkgdesc="Dracula theme for KDE Plasma 5"
arch=("any")
url="https://github.com/dracula/${_pkgname}"
license=("GPL3")
options=("!strip")
makedepends=("git")
source=("git+https://github.com/dracula/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_plasma5-themes-dracula-git() {
  provides=("plasma5-themes-dracula")
  optdepends=("dracula-gtk-theme-git: Matching GTK theme"
              "kvantum-theme-dracula-git: Dracula theme for Kvantum")

  cd "${_pkgname}/kde"

  mkdir -p "${pkgdir}/usr/share/aurorae/themes" "${pkgdir}/usr/share/sddm/themes"

  cp -r aurorae/* "${pkgdir}/usr/share/aurorae/themes"
  cp -r color-schemes "${pkgdir}/usr/share"
  cp -r plasma "${pkgdir}/usr/share"
  cp -r sddm/* "${pkgdir}/usr/share/sddm/themes"
}

package_kvantum-theme-dracula-git() {
  provides=("kvantum-theme-dracula")
  pkgdesc="Dracula theme for Kvantum"
  depends=("kvantum")

  cd "${_pkgname}/kde"

  mkdir -p "${pkgdir}/usr/share/Kvantum"

  cp -r kvantum/* "${pkgdir}/usr/share/Kvantum"
}
