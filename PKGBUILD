# -*- shell-script -*-
#
# Contributor: Adrian C. <anrxc..sysphere.org>

pkgname=vicious-git
_gitname=vicious
pkgver=2.1.3.2.g9fc02f1
_luaver="5.2"
pkgrel=1
pkgdesc="Modular widget library for window managers"
arch=("any")
url="http://git.sysphere.org/vicious/about/"
license=("GPL2")
depends=("lua")
makedepends=("git")
optdepends=("awesome: for which vicious was mainly written for"
            "hddtemp: for the HDD Temp widget type"
            "alsa-utils: for the Volume widget type"
            "wireless_tools: for the Wireless widget type"
            "curl: for widget types accessing network resources")
provides=("vicious")
conflicts=("vicious")
install="${pkgname}.install"
source=(${pkgname}::git+http://git.sysphere.org/${_gitname})
sha1sums=("SKIP")


pkgver() {
  cd "${pkgname}"

# git describe --always | sed 's|-|.|g'
  git describe --always | sed 's|^[^0-9]*||;s|\.g[a-f0-9]*$||;s|-|.|g'
}


build() {
  cd "${pkgname}"

# Download or update the library
# - automatic since pacman v4.1
}


package () {
  cd "${pkgname}"

# Install the vicious library
  install -d "${pkgdir}/usr/share/lua/${_luaver}/${_gitname}"
  install -m644 *.lua "${pkgdir}/usr/share/lua/${_luaver}/${_gitname}"

# Install vicious widgets
  install -d "${pkgdir}/usr/share/lua/${_luaver}/${_gitname}/widgets"
  install -m644 widgets/*.lua "${pkgdir}/usr/share/lua/${_luaver}/${_gitname}/widgets"

# Install user contributed widgets
  install -d "${pkgdir}/usr/share/lua/${_luaver}/${_gitname}/contrib"
  install -m644 contrib/*.lua "${pkgdir}/usr/share/lua/${_luaver}/${_gitname}/contrib"

# Install support for legacy lua51
  install -d "${pkgdir}/usr/share/lua/5.1"
  ln -s /usr/share/lua/${_luaver}/vicious ${pkgdir}/usr/share/lua/5.1/vicious

# Install the documentation
  install -D -m644 CHANGES "${pkgdir}/usr/share/doc/${_gitname}/CHANGES"
  install -m644 TODO "${pkgdir}/usr/share/doc/${_gitname}" 
  install -m644 README "${pkgdir}/usr/share/doc/${_gitname}" 
  install -m644 LICENSE "${pkgdir}/usr/share/doc/${_gitname}"
}
