# Maintainer: David Runge <dave@sleepmap.de>
pkgname=crypted-backups-git
pkgver=0.1.r11.gf07a4a2
_pkg=crypted-backups
pkgrel=3
pkgdesc="Backup scripts using systemd timer/service units and gpg encryption"
arch=('any')
url="https://sleepmap.de/software/crypted-backups"
license=('GPL3')
depends=('xz')
makedepends=('git')
provides=('crypted-backups')
conflicts=('crypted-backups')
backup=('etc/crypted-backups')
source=("git+https://git.sleepmap.de/software/${_pkg}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkg"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkg"
  install -t "${pkgdir}/usr/lib/systemd/scripts/" -Dm 755 scripts/*
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${_pkg}/README.rst"
  install -t "${pkgdir}/usr/lib/systemd/system/" -Dm 644 system/*
  install -t "${pkgdir}/usr/lib/systemd/user/" -Dm 644 user/* 
  install -Dm 644 "config/system/${_pkg}" "${pkgdir}/etc/${_pkg}"
  install -Dm 644 "config/user/${_pkg}" "${pkgdir}/etc/skel/.${_pkg}"
}

# vim:set ts=2 sw=2 et:
