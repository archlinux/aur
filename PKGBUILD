# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=gnome-shell-extension-compiz-alike-windows-effect-git
pkgver=r43.8d2ed94
pkgrel=1
pkgdesc="Wobbly windows effect inspired by the Compiz ones"
arch=('any')
url="https://github.com/hermes83/compiz-alike-windows-effect.git"
install=compiz-alike.install
license=('unknown')
depends=('gnome-shell>=3.28')
makedepends=('git' 'glib2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("${pkgname%-git}::git+https://github.com/hermes83/compiz-alike-windows-effect.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  _uuid="compiz-alike-windows-effect@hermes83.github.com"
	cd "${srcdir}/${pkgname%-git}"
	install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
	cp -R * "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  #rebuild compiled GSettings schemas if missing
  if [[ ! -f "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/schemas/gschemas.compiled" ]]; then
  	glib-compile-schemas ${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/schemas
  fi
  chmod -R 755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
}

