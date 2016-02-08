# Maintainer: Lukas Sabota <lukas@lwsabota.com>
# Contributor: K. Hampf <khampf@users.sourceforge.net>

pkgbase="g13"
pkgname="g13-git"
pkgver=20160120
pkgrel=1
pkgdesc="Userspace driver for the Logitech G13 Keyboard"
arch=('x86_64' 'i686')
url="https://github.com/ecraven/g13"
license=('unknown')
depends=('boost-libs')
makedepends=('git' 'boost')
source=("${pkgname}::git://github.com/ecraven/g13")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  local desc=$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  if [ -z "$desc" ]; then
    # date of last commit as YYYYMMDD
    git log -1 --date=format:%Y%m%d --format=%cd
  fi
}

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  install -d -m755 "${pkgdir}/usr/bin"
  install -D -m755 g13d "${pkgdir}/usr/bin"
  install -D -m755 pbm2lpbm "${pkgdir}/usr/bin"
  install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -D -m644 README.md g13.png g13.svg "${pkgdir}/usr/share/doc/${pkgname}"
  install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}/examples"
  install -D -m644 91-g13.rules clock.sh *.lpbm *.bind "${pkgdir}/usr/share/doc/${pkgname}/examples"
} 

