# Maintainer: Michel Blanc <mb@mbnet.fr>

pkgname=clac
pkgver=0.2.1.r0.g7375e02
pkgrel=1
pkgdesc='A command line, stack-based calculator with postfix notation'
url='https://github.com/soveran/clac'
arch=('i686' 'x86_64')
license=('BSD')

source=("clac::git+https://github.com/soveran/clac")
sha1sums=('SKIP')

#options=('')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  manprefix="${pkgdir}/usr/share/man"
  mkdir -p "${manprefix}/man1"
  echo Created ${manprefix}/man1
  make MANPREFIX="${manprefix}" PREFIX="${pkgdir}/usr" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
