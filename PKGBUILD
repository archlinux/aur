# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=apostrophe-git
pkgver=2.2.0.1.r1.g0b2fec0
pkgrel=1
pkgdesc="A distraction free Markdown editor for GNU/Linux made with GTK+"
arch=('any')
url="https://gitlab.gnome.org/somas/apostrophe"
license=('GPL3')
depends=('webkit2gtk' 'gspell' 'python-pypandoc' 'python-regex' 'python-levenshtein'
         'python-pyenchant' 'python-gobject' 'python-cairo' 'gobject-introspection')
makedepends=('git' 'meson' 'appstream-glib')
optdepends=('texlive-core: Export as PDF files'
            'otf-fira-mono: Recommended font (OTF)'
            'ttf-fira-mono: Recommended font (TTF)')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/somas/apostrophe.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson "${pkgname%-git}" build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
