# Maintainer: David Runge <dave@sleepmap.de>
pkgname=rts-git
pkgver=0.2.0.r0.g326a178
_basename=rts
pkgrel=1
pkgdesc="Collection of scripts and systemd services to be used exclusively on linux-rt.\ Enables setting CPU scheduling policies and priorities (amongst others) (during boot) using tuna."
arch=('any')
url="https://sleepmap.de/software/rts"
license=('GPL3')
groups=()
depends=('linux-rt' 'tuna')
makedepends=('git')
provides=('rts')
conflicts=('rts')
replaces=()
backup=('etc/rts/rts')
options=()
install=
source=("${_basename}::git://sleepmap.de/software/rts.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_basename"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_basename"
  install -Dm 755 bin/rts ${pkgdir}/usr/bin/rts
  install -Dm 644 README.rst ${pkgdir}/usr/share/doc/${_basename}/README.rst
  install -Dm 644 NEWS ${pkgdir}/usr/share/doc/${_basename}/NEWS
  install -d ${pkgdir}/usr/lib/systemd/system/
  install -Dm 644 system/* ${pkgdir}/usr/lib/systemd/system/
  install -d ${pkgdir}/etc/${_basename}/examples/
  install -Dm 644 config/examples/* ${pkgdir}/etc/${_basename}/examples/
  install -Dm 644 config/${_basename} ${pkgdir}/etc/${_basename}/${_basename}
}

# vim:set ts=2 sw=2 et:
