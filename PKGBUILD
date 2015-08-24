# Maintainer: Valsu [arch + hylia.de]

pkgname=spc2it-git
pkgver=r26.gb95b6ac
pkgrel=1
pkgdesc="Converts SPC700 sound files to the Impulse Tracker format"
url=https://github.com/uyjulian/spc2it
arch=('x86_64' 'i686')
license=('GPL2')
depends=('glibc')
makedepends=('git')
provides=('spc2it')
conflicts=('spc2it')
source=($pkgname::'git+https://github.com/uyjulian/spc2it.git')
md5sums=('SKIP')

build() {
  cd "${srcdir}"/$pkgname

  printf 'r%s.%s\n' "$(git rev-list --count HEAD)" "$(git describe --always)"

  cmake .  
  make
}

package() {
  cd "${srcdir}"/$pkgname

  install -D -m755 spc2it "${pkgdir}"/usr/bin/spc2it
  mkdir -p "${pkgdir}"/usr/share/doc
  cp -rf doc/ "${pkgdir}"/usr/share/doc/spc2it/
}

# vim:set ts=2 sw=2 et:
