# Maintainer: h-a <ha1029.dev at aol dot com>
pkgname=ttf-ricty-nerd
pkgver=3.2.0
pkgrel=1
pkgdesc="Japanese TrueType font for developers by mixing Inconsolata Nerd Font and Migu 1M."
arch=("any")
url="https://rictyfonts.github.io/"
license=("OFL-1.1 AND IPA")
depends=("fontconfig")
makedepends=("ttf-inconsolata-nerd>=3.2.0" "ttf-migu" "fontforge")
install=ttf-ricty-nerd.install
source=(
	"https://rictyfonts.github.io/files/ricty_generator.sh"
	"ricty_generator.patch"
	"OFL-1.1.txt"
	"IPA_Font_License_Agreement_v1.0.txt"
)
sha256sums=(
	"86bf0fed84ef806690b213798419405d7ca2a1a4bed4f6a28b87c2e2d07ad60d"
    "f1a2878c50e1c3901b8f0eeba5148f082d4aefba952bb1ac87efe85c99168937"
	"29bd0cfd0fb2a45f9b057c834a057724bae1f63b525a8ac83d3e7525706d9f80"
	"4c84dd528ec3044638ec346fc1ee27cd1eb95dfc04cbc6a881b3ca7a7f517e54"
)

prepare() {
	cd "${srcdir}"
	ln -sfv /usr/share/fonts/TTF/InconsolataNerdFont-Regular.ttf Inconsolata-Regular.ttf
	ln -sfv /usr/share/fonts/TTF/InconsolataNerdFont-Bold.ttf Inconsolata-Bold.ttf
	patch -u --follow-symlinks -o ricty_nerd_generator.sh < ricty_generator.patch
	chmod +x ricty_nerd_generator.sh
}

build() {
	cd "${srcdir}"
	./ricty_nerd_generator.sh -a auto
}

package() {
	install -d "${pkgdir}"/usr/share/fonts/TTF
	install -m644 "${srcdir}"/*.ttf "${pkgdir}"/usr/share/fonts/TTF
	install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
	install -m644 OFL-1.1.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/OFL-1.1.txt
	install -m644 IPA_Font_License_Agreement_v1.0.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/IPA_Font_License_Agreement_v1.0.txt
}
