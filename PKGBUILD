# Maintainer: Hayate Nakamura <is01.njb at gmail dot com>
pkgname=anthy-unicode-git
_pkgname=anthy-unicode
pkgver=r83.360c112
pkgrel=1
pkgdesc='Hiragana text to Kana Kanji mixed text Japanese input method'
arch=('x86_64')
url='https://github.com/fujiwarat/anthy-unicode'
license=('LGPL' 'GPL')
source=("${_pkgname}::git+${url}.git")
sha512sums=('SKIP')
makedepends=('emacs' 'git')
provides=('anthy-unicode' 'anthy')
conflicts=('anthy-unicode' 'anthy')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make EMACS=emacs DESTDIR="${pkgdir}" install

	cd ${pkgdir}/etc
	ln -sf anthy-unicode.conf anthy-conf

	cd ${pkgdir}/usr/bin
	ln -sf anthy-agent-unicode anthy-agent
	ln -sf anthy-dic-tool-unicode anthy-dic-tool
	ln -sf anthy-morphological-analyzer-unicode anthy-morphological-analyzer

	cd ${pkgdir}/usr/include
	ln -sf anthy-unicode-1.0/anthy anthy

	cd ${pkgdir}/usr/lib
	ln -sf libanthy-unicode.so.0.1.0 libanthy.so.0.1.0
	ln -sf libanthy-unicode.so.0.1.0 libanthy.so.0
	ln -sf libanthy-unicode.so.0.1.0 libanthy.so
	ln -sf libanthydic-unicode.so.0.1.0 libanthydic.so.0.1.0
	ln -sf libanthydic-unicode.so.0.1.0 libanthydic.so.0
	ln -sf libanthydic-unicode.so.0.1.0 libanthydic.so
	ln -sf libanthyinput-unicode.so.0.0.0 libanthyinput.so.0.0.0
	ln -sf libanthyinput-unicode.so.0.0.0 libanthyinput.so.0
	ln -sf libanthyinput-unicode.so.0.0.0 libanthyinput.so

	cd ${pkgdir}/usr/share
	ln -sf anthy-unicode anthy

	mkdir ${pkgdir}/usr/share/emacs/site-lisp/anthy
	cd ${pkgdir}/usr/share/emacs/site-lisp/anthy
	ln -sf ../anthy-unicode/anthy-unicode-azik.el anthy-azik.el
	ln -sf ../anthy-unicode/anthy-unicode-conf.el anthy-conf.el
	ln -sf ../anthy-unicode/anthy-unicode-dic.el anthy-dic.el
	ln -sf ../anthy-unicode/anthy-unicode-isearch.el anthy-isearch.el
	ln -sf ../anthy-unicode/anthy-unicode-kyuri.el anthy-kyuri.el
	ln -sf ../anthy-unicode/anthy-unicode.el anthy.el
	ln -sf ../anthy-unicode/leim-list.el leim-list.el
}
