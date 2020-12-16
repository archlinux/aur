# Maintainer: Christian Schendel (doppelhelix@gmail.com)

pkgname=gnome-shell-extension-nightthemeswitcher-git
pkgver=v37.r27.4dd6e6f
pkgrel=1
_commit=4dd6e6f17e7e98da94f5072c4dea8052cf0fc2c6
pkgdesc="Automatically toggle your light and dark themes variants"
arch=('any')
url="https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension"
install=${pkgname%-git}.install
license=('GPL3')
groups=('gnome-shell-extensions')
depends=('gnome-shell>=3.28')
makedepends=('git' 'glib2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


package() {
  _uuid="nightthemeswitcher@romainvigier.fr"
  cd "${srcdir}/${pkgname%-git}"
  chmod -R 644 ./*
  install -d "${pkgdir}/usr/share/gnome-shell/extensions/"
  mv src ${_uuid}
  cp -r "${_uuid}" "${pkgdir}/usr/share/gnome-shell/extensions/"
  #rebuild compiled schemas if missing
  if [[ ! -f "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/schemas/gschemas.compiled" ]]; then
  	glib-compile-schemas ${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/schemas
  fi
  chmod -R 755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
}

