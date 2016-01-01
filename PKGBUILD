# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=nap-git
_gitname=nap
pkgver=0.2.5.r0.g7ec0041
pkgrel=1
pkgdesc='sleep with a progressbar (git version)'
arch=('i686' 'x86_64')
url='https://github.com/Kwpolska/nap'
license=('BSD')
depends=()
makedepends=('make' 'git')
conflicts=('nap')
replaces=('nap')
options=(!emptydirs)
source=("git://github.com/Kwpolska/${_gitname}.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_gitname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

# vim:set ts=2 sw=2 et:
