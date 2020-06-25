# Maintainer: Benjamin Vialle <archlinux@vialle.io>
# PGP ID: 72DF86FBBBBD5EDAE8FF1834826884A347F9FD9A

pkgname=man-pages-fr-git
_gitname=manpages-l10n
pkgver=r10158.22d941b2f
pkgrel=1
pkgdesc="French man pages (Git version)"
arch=('any')
url="https://salsa.debian.org/manpages-l10n-team/manpages-l10n"
license=('GPL3')
conflicts=('man-pages-fr')
depends=('man-db')
makedepends=('po4a' 'git')
changelog=$pkgname.changelog
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
  
  cd po/fr
  make
}

package() {
  cd "${srcdir}"/manpages-l10n/po/fr

  make DESTDIR="${pkgdir}" install
}
