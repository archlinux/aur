# Maintainer: Sam Mulvey <archlinux@sammulvey.com>
# This PKGBULID is licensed under 0BSD

pkgname=gnome-shell-extension-utcclock-git
_reponame=UTCClock
pkgver=r164.87c82d7
pkgrel=1
pkgdesc="show current UTC time in GNOME topbar"
arch=('x86_64' 'aarch64')
url=https://github.com/injcristianrojas/UTCClock
license=("MIT")

depends=("gnome-shell")
makedepends=("git" "jq" "glib2")

source=(
  "git+https://github.com/injcristianrojas/UTCClock"
)
sha256sums=(
    'SKIP'
)

pkgver() {
	cd "${srcdir}/${_reponame}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_reponame}"
	glib-compile-schemas schemas/
}

package() {
	cd "${srcdir}/${_reponame}"

	_uuid=$(jq -r .uuid metadata.json)
	echo "==> GNOME UUID: ${_uuid}"


	mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
	cp -R extension.js LICENSE metadata.json schemas/ "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"


}


