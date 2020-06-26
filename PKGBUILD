# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=apostrophe-git
pkgver=2.2.0.3.r29.gd5a9fdc
pkgrel=1
pkgdesc="A distraction free Markdown editor for GNU/Linux made with GTK+"
arch=('any')
url="https://gitlab.gnome.org/somas/apostrophe"
license=('GPL3')
depends=('webkit2gtk' 'gspell' 'python-pypandoc' 'python-regex' 'python-levenshtein'
         'python-pyenchant' 'python-gobject' 'python-cairo' 'gobject-introspection')
makedepends=('git' 'meson')
checkdepends=('appstream')
optdepends=('texlive-latexextra: for the pdftex module'
            'mathjax: for formula preview'
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
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
