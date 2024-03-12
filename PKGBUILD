# Maintainer: WhitedonSAP <ayrtonarantes0987654321ayrt008 at gmail dot com>

pkgname=man-pages-pt_br-git
_gitname=manpages-l10n
pkgver=r27142.83e16d6348
pkgrel=1
pkgdesc="Brazilian Portuguese man pages (Git version)"
arch=('any')
url="https://salsa.debian.org/manpages-l10n-team/manpages-l10n"
license=('GPL3')
conflicts=('man-pages-pt_br')
depends=('man')
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
  
  cd po/pt_BR
  make
}

package() {
  cd "${srcdir}"/manpages-l10n/po/pt_BR

  make DESTDIR="${pkgdir}" install
}
