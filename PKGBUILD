# Maintainer: Mario Blättermann <mario.blaettermann@gmail.com>

pkgname=man-pages-nb-git
_gitname=manpages-l10n
pkgver=r20130.579aa790b4
pkgrel=1
pkgdesc="Norwegian bokmål man pages (Git version)"
arch=('any')
url="https://salsa.debian.org/manpages-l10n-team/manpages-l10n"
license=('GPL3')
conflicts=('man-pages-nb')
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
  
  cd po/nb
  make
}

package() {
  cd "${srcdir}"/manpages-l10n/po/nb

  make DESTDIR="${pkgdir}" install
}
