# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: VargArch <roels.jorick@gmail.com>
# Contributor: zsrkmyn
# Contributor: marsam

_gitname=ctags
pkgname=universal-ctags-git
pkgver=0.r5294.cb4476eb
pkgrel=1
pkgdesc="Multilanguage reimplementation of the Unix ctags utility"
arch=('i686' 'x86_64')
url="https://ctags.io/"
license=('GPL')
depends=('libxml2' 'jansson' 'libyaml' 'bash')
makedepends=('git' 'python-docutils')
provides=('ctags')
conflicts=('ctags')
source=("git+https://github.com/universal-ctags/ctags.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"

  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"

  ./autogen.sh
  ./configure --prefix=/usr \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc
  make
}

check() {
  cd "${srcdir}/${_gitname}"

  mkdir "${srcdir}/testhome"
  HOME="${srcdir}/testhome" make -k check
}

package() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR="${pkgdir}" install
}
