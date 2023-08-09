# Maintainer: robertfoster
pkgname=portage-git
pkgver=3.0.49.r35.058613d54
pkgrel=1
pkgdesc="Gentoo's package management system "
url="http://www.gentoo.org/proj/en/portage/index.xml"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python' 'xmlto' 'rsync' 'eselect-git')
source=("${pkgname%-git}::git://anongit.gentoo.org/proj/portage.git")
sha384sums=('SKIP')
makedepends=('epydoc' 'git' 'docbook-xsl')
install="${pkgname}.install"

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --match 'portage-*' | sed 's/^portage-//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  arch-meson . build
  meson compile -C build
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  meson install -C build --destdir "$pkgdir"
}

check() {
  cd "${srcdir}/${pkgname%-git}"
  meson test -C build
}
