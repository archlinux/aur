# Maintainer: Micah Halter <micah@mehalter.com>

pkgname=micah-man
pkgver=r157.f924ffb
pkgrel=1
pkgdesc="Manpages for Micah Halter's resume"
arch=('any')
reponame="mehalter.com"
url="https://code.mehalter.com/${reponame}"
source=("git+https://github.com/mehalter/${reponame}.git")
sha256sums=('SKIP')
depends=()
makedepends=('git' 'pandoc')
license=('GPL')

pkgver() {
	cd "${reponame}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${reponame}"
	pandoc --output=micah.7 --metadata pagetitle="..." --template=templates/man-template.man content.md
}

package() {
	mkdir -p "${pkgdir}/usr/share/man/man7"
	cd "${srcdir}/${reponame}"
	install -m 644 -C micah.7 "${pkgdir}/usr/share/man/man7/"
}
