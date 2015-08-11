# Maintainer: David Manouchehri <david@davidmanouchehri.com>
pkgname=shallot-git
_gitname=Shallot
_gitauthor=katmagic
pkgver=0.0.3.r26.g831de01
pkgrel=1
pkgdesc="Shallot allows you to create customized .onion addresses for your hidden service."
arch=('i686' 'x86_64')
source=("git://github.com/$_gitauthor/$_gitname.git")
url=("https://github.com/$_gitauthor/$_gitname")
license=('custom')
makedepends=('git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -E 's/shallot.//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"

  # Build
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"

  # Install
  mkdir -p $pkgdir/usr/bin/
  cp shallot $pkgdir/usr/bin/ 
 
  # License
  echo ${_gitname,,}
  install -D LICENSE "${pkgdir}/usr/share/licenses/${_gitname,,}/LICENSE.txt"
}
