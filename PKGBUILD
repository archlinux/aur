# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=prads-git
pkgver=0.3.3.r20.g407cf7c
pkgrel=1
pkgdesc='A Passive Real-time Asset Detection System'
url='http://gamelinux.github.io/prads/'
arch=('i686' 'x86_64')
license=('custom:Perl')
makedepends=('git' 'python-docutils' 'fakeroot' 'binutils' 'make' 'gcc')
depends=('bash' 'libpcap')
#optdepends=('')
backup=('etc/prads/prads.conf')
source=("${pkgname}::git+https://github.com/gamelinux/prads.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}
  make PREFIX=/usr CONFDIR=/etc/prads
}

package() {
  cd ${pkgname}
  make PREFIX=/usr CONFDIR=/etc/prads DESTDIR="$pkgdir" install
  install -DTm644 doc/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
