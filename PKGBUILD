# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Baptiste Grenier <baptiste@bapt.name>
# Contributor: Pablo Olmos de Aguilera Corradini <pablo <at] glatelier (dot} org>
# Contributor: Sander van Kasteel <info at sandervankasteel dot nl>
pkgname=gtg-git
pkgver=0.4.r254.ge7130c6b
pkgrel=3
pkgdesc="Getting Things GNOME! is a personal tasks and TODO-list items organizer for GNOME"
url="https://wiki.gnome.org/Apps/GTG"
arch=('x86_64')
license=('GPL')
depends=('python-liblarch' 'python-lxml')
makedepends=('git' 'meson')
optdepends=('python-cheetah3: for the Export and print plugin'
            'texlive-bin: pdflatex, for the Export and print plugin'
            'texlive-core: pdfjam, for the Export and print plugin'
            'pdftk: for the Export and print plugin'
            'hamster-time-tracker: send a task to the Hamster time tracking applet'
            'yelp: view user manual')
checkdepends=('python-nose' 'python-mock')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/getting-things-gnome/gtg.git')
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
	cd "$srcdir/${pkgname%-git}"
	python run-tests
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
