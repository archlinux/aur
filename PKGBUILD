# Maintainer: Mario Blättermann <mario.blaettermann@gmail.com>

pkgname=man-pages-hu-git
_gitname=manpages-l10n
pkgver=r16937.ba3ae0c9d8
pkgrel=1
pkgdesc="Hungarian man pages (Git version)"
arch=('any')
url="https://salsa.debian.org/manpages-l10n-team/manpages-l10n"
license=('GPL3')
conflicts=('man-pages-hu')
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
  
  cd po/hu
  make
}

package() {
  cd "${srcdir}"/manpages-l10n/po/hu

  make DESTDIR="${pkgdir}" install
}
