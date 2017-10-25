# Maintainer: David Runge <dave@sleepmap.de>
pkgname=rts-git
pkgver=0.2.0.r0.g326a178
_pkg=rts
pkgrel=3
pkgdesc="A collection of systemd services and scripts that allow to set pre-defined real-time related scheduling settings, using tuna."
arch=('any')
url="https://sleepmap.de/software/rts"
license=('GPL3')
depends=('linux-rt' 'tuna')
makedepends=('git')
provides=('rts')
conflicts=('rts')
backup=('etc/rts/rts')
source=("git+https://git.sleepmap.de/software/rts.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkg}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkg}"
  install -Dm 0755 bin/rts "${pkgdir}/usr/bin/rts"
  install -Dm 0644 README.rst "${pkgdir}/usr/share/doc/${_pkg}/README.rst"
  install -Dm 0644 NEWS "${pkgdir}/usr/share/doc/${_pkg}/NEWS"
  install -t "${pkgdir}/usr/lib/systemd/system/" -Dm 0644 system/*
  install -t "${pkgdir}/etc/${_pkg}/examples/" -Dm 0644 config/examples/*
  install -Dm 0644 "config/${_pkg}" "${pkgdir}/etc/${_pkg}/${_pkg}"
}

# vim:set ts=2 sw=2 et:
