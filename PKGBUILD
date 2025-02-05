# Maintainer: Daniel Liland <liland@await.sh>
pkgname=haystack-editor-bin
_pkgname=haystack-editor
pkgver=0.20.2
pkgrel=1
pkgdesc="An IDE built on top of a canvas, Haystack takes care of the tedious and confusing parts of coding for you"
arch=('x86_64')
url="https://haystackeditor.com"
license=(none)
provides=('haystack-editor')
conflicts=('haystack-editor')
depends=(libxkbfile gnupg gtk3 libsecret nss gcc-libs libnotify libxss glibc lsof shared-mime-info xdg-utils alsa-lib)

source=(haystack-editor.desktop)
source_x86_64=("https://d2dv27o1k99orf.cloudfront.net/Haystack+Editor+Linux-${pkgver}.zip")
sha256sums=('e60118c2d914911da80fcea2976081d247cdfe8b24ca1baa74ebfadd984784bf')
sha256sums_x86_64=('7bf562eb83c31883955c269efa5b1d63b5ddebddc8c9eb739442d682b9e7eb5c')

package() {
	_pkg="Haystack"

	install -d "${pkgdir}/opt/${_pkgname}"
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/applications"
	install -d "${pkgdir}/usr/share/icons"

	install -m644 "${srcdir}/${_pkg}/resources/app/resources/linux/haystack.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
	install -m644 "${srcdir}/haystack-editor.desktop" "${pkgdir}/usr/share/applications/haystack-editor.desktop"

	install -Dm 644 "${srcdir}/${_pkg}/resources/completions/bash/haystack-editor" "${pkgdir}/usr/share/bash-completion/completions/haystack-editor"
	install -Dm 644 "${srcdir}/${_pkg}/resources/completions/zsh/_haystack-editor" "${pkgdir}/usr/share/zsh/site-functions/_haystack-editor"

	cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${_pkgname}"
	ln -s "/opt/${_pkgname}/bin/haystack-editor" "${pkgdir}/usr/bin/haystack-editor"


}
