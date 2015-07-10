# Contributor: VargArch <roels.jorick@gmail.com>
# Contributor: zsrkmyn
# Contributor: marsam

pkgname=universal-ctags-git
_gitname=ctags
pkgver=0.r2366.2ead2d5
pkgrel=1
pkgdesc="multilanguage reimplementation of the Unix ctags utility"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bash')
makedepends=('git')
provides=('ctags')
conflicts=('ctags')
options=('!emptydirs')
url="https://ctags.io/"
source=("${_gitname}::git+https://github.com/universal-ctags/ctags.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  autoreconf -vif
  ./configure --prefix=/usr \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc
  make
}

check() {
  cd "${srcdir}/${_gitname}"
  make check
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
