# Maintainer: Hayate Nakamura <hayatehay.njb at gmail dot com>

pkgname=anthy-unicode
pkgver=1.0.0.20260213
pkgrel=2
pkgdesc='Hiragana text to Kana Kanji mixed text Japanese input method'
arch=('x86_64')
url='https://github.com/fujiwarat/anthy-unicode'
license=('LGPL-2.1-or-later' 'GPL-2.0-only')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('fcb7651c3d1cfa389fc1d25606c088528154e659668af92908c202b5cf936f81fc28b616f3bc764be4835a8016c347c1a7e0a14691bd1a7697bac3df842d694e')
makedepends=('emacs')
provides=('anthy')
conflicts=('anthy')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc
 make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
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
