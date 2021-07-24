# Maintainer: Mario Blättermann <mario.blaettermann@gmail.com>

pkgname=man-pages-mk-git
_gitname=manpages-l10n
pkgver=r15463.11094f0a4b
pkgrel=1
pkgdesc="Macedonian man pages (Git version)"
arch=('any')
url="https://salsa.debian.org/manpages-l10n-team/manpages-l10n"
license=('GPL3')
conflicts=('man-pages-mk')
depends=('man-db')
makedepends=('po4a' 'git')
options=('!emptydirs')
source=("${_gitname}::git+https://salsa.debian.org/manpages-l10n-team/manpages-l10n.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/manpages-l10n
  ./configure --prefix=/usr --enable-distribution=archlinux
  
  cd po/mk
  make
}

package() {
  cd "${srcdir}"/manpages-l10n/po/mk

  make DESTDIR="${pkgdir}" install
}
