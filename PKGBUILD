# Maintainer: Jaden Peterson <jadenpeterson150@gmail.com>

pkgname=adapta-gtk-theme-3.94
pkgver=3.94.0.149
pkgrel=1
pkgdesc='An adaptive Gtk+ theme based on Material Design Guidelines'
arch=('any')
url='https://github.com/adapta-project/adapta-gtk-theme'
license=('CCPL' 'GPL2')

optdepends=('gtk-engine-murrine: for gtk2 themes'
            'noto-fonts: Recommended font'
            'ttf-roboto: Recommended font')

makedepends=('git' 'inkscape' 'parallel' 'sassc')

provides=("adapta-gtk-theme=${pkgver}")
conflicts=('adapta-gtk-theme')

source=("git+https://github.com/adapta-project/adapta-gtk-theme.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
	cd adapta-gtk-theme

	./autogen.sh \
		--prefix='/usr' \
		--enable-parallel \
		--enable-planl \
		--enable-telegram \

	make
}

package() {
	cd adapta-gtk-theme

	make DESTDIR="${pkgdir}" install

	install -d "${pkgdir}/usr/share/plank/themes"
	ln -s /usr/share/themes/Adapta/plank "${pkgdir}/usr/share/plank/themes/Adapta"
}
