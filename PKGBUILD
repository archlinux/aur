# Maintainer: Jonathon Fernyhough <jonathon att manjaro dott org>
# Contributer: Foppe Hemminga <foppe at hemminga dot net>
# Contributer: actionless <actionless dot loveless at gmail.com>
# Contributer: Schala <schalaalexiazeal at gmail.com>
pkgname=aporia-git
pkgver=0.4.1.40
pkgrel=1
pkgdesc="Aporia is an IDE for the Nim programming language"
arch=('i686' 'x86_64')
url="https://github.com/nim-lang/Aporia"
license=("GPL2")
makedepends=('git' 'imagemagick' 'nim' 'nimble')
depends=('gtksourceview2' 'hicolor-icon-theme')
optdepends=('nim' 'nimsuggest')
provides=('aporia')
conflicts=('aporia')
source=("${pkgname%-*}::git+https://github.com/nim-lang/Aporia.git"
        'aporia.desktop')
sha256sums=('SKIP'
            '1f14d3b4701f54aafa12b0dc167e05db6cff1ae411e1ff827643a4cb5974a4ba')
_iconsizes=(32 48 64 96 128 256 512)

pkgver () {
	cd "${srcdir}/${pkgname%-*}" || exit
	git describe --tags | sed 's|^v||;s|\(.*-.*\)-.*|\1|;s|-|.|'
}

prepare() {
    cd "${srcdir}/${pkgname%-*}" || exit
    for size in "${_iconsizes[@]}"; do
        convert assets/Icon1024.png -resize "${size}x${size}" "assets/aporia-${size}.png"
    done
}

build() {
	cd "${srcdir}/${pkgname%-*}" || exit
	nimble build -y
}

package() {
	cd "${srcdir}/${pkgname%-*}" || exit
	install -Dm755 "aporia"                                            "${pkgdir}/usr/bin/aporia"
	install -Dm644 "${srcdir}/aporia.desktop"                          "${pkgdir}/usr/share/applications/aporia.desktop"
	install -Dm644 "share/gtksourceview-2.0/language-specs/nael.lang"  "${pkgdir}/usr/share/gtksourceview-2.0/language-specs/nael.lang"
	install -m644  "share/gtksourceview-2.0/language-specs/nim.lang"   "${pkgdir}/usr/share/gtksourceview-2.0/language-specs/"
	install -Dm644 "share/gtksourceview-2.0/styles/brackets.xml"       "${pkgdir}/usr/share/gtksourceview-2.0/styles/brackets.xml"
	install -m644  "share/gtksourceview-2.0/styles/breeze.xml"         "${pkgdir}/usr/share/gtksourceview-2.0/styles/"
	install -m644  "share/gtksourceview-2.0/styles/dark_bliss.xml"     "${pkgdir}/usr/share/gtksourceview-2.0/styles/"
	install -m644  "share/gtksourceview-2.0/styles/deep_blue.xml"      "${pkgdir}/usr/share/gtksourceview-2.0/styles/"
	install -m644  "share/gtksourceview-2.0/styles/distant_shores.xml" "${pkgdir}/usr/share/gtksourceview-2.0/styles/"
	install -m644  "share/gtksourceview-2.0/styles/darknim.xml"        "${pkgdir}/usr/share/gtksourceview-2.0/styles/"
	install -m644  "share/gtksourceview-2.0/styles/eggshell.xml"       "${pkgdir}/usr/share/gtksourceview-2.0/styles/"
	install -m644  "share/gtksourceview-2.0/styles/ekini_edit.xml"     "${pkgdir}/usr/share/gtksourceview-2.0/styles/"
	install -m644  "share/gtksourceview-2.0/styles/github.xml"         "${pkgdir}/usr/share/gtksourceview-2.0/styles/"
	install -m644  "share/gtksourceview-2.0/styles/github_classic.xml" "${pkgdir}/usr/share/gtksourceview-2.0/styles/"
	install -m644  "share/gtksourceview-2.0/styles/less.xml"           "${pkgdir}/usr/share/gtksourceview-2.0/styles/"
	install -m644  "share/gtksourceview-2.0/styles/monodev.xml"        "${pkgdir}/usr/share/gtksourceview-2.0/styles/"
	install -m644  "share/gtksourceview-2.0/styles/piekno.xml"         "${pkgdir}/usr/share/gtksourceview-2.0/styles/"
	install -m644  "share/gtksourceview-2.0/styles/yumbum.xml"         "${pkgdir}/usr/share/gtksourceview-2.0/styles/"
	install -Dm644 "copying.txt"                                       "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
    for size in "${_iconsizes[@]}"; do
    	install -Dm644 "assets/aporia-${size}.png"  "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/aporia.png"
    done
}
