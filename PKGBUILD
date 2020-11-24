# Maintainer: Kalle Lindqvist <kalle.lindqvist@mykolab.com>

pkgname=gnome-shell-extension-password-manager-search-git
pkgver=r47.2fe8a8c
pkgrel=2
pkgdesc="Search for logins stored in online password managers."
arch=(any)
url="https://github.com/ellakk/password-manager-search"
license=(GPL3)
depends=(gnome-shell)
makedepends=(git glib2)
optdepends=('1password-cli: For 1Password support'
	'bitwarden-cli: For Bitwarden support'
	'lastpass-cli: For LastPass support'
	'xclip: Option for setting the clipboard'
	'xsel: Option for setting the clipboard')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	glib-compile-schemas "${srcdir}/${pkgname}/schemas/"
}

package() {
	_uuid="password-manager-search@kalle.lindqvist.mykolab.com"
	cd "${srcdir}/${pkgname}"

	install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
	cp -r * "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
}

