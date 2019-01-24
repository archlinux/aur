# Maintainer: kpcyrd <git@rxv.cc>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gitname=usbctl
pkgname=usbctl-git
pkgver=1.1.r2.gf911f27
pkgrel=1
pkgdesc='Linux-hardened deny_new_usb control'
url='https://github.com/anthraxx/usbctl'
arch=('any')
license=('MIT')
depends=('linux-hardened' 'bash' 'usbutils' 'coreutils' 'diffutils' 'procps-ng' 'grep' 'util-linux')
makedepends=('git')
checkdepends=('shellcheck')
optdepends=('sudo: elevate to root when needed')
provides=('usbctl')
conflicts=('usbctl')
source=(git+https://github.com/anthraxx/$_gitname.git)
sha512sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd $_gitname
  make test
}

package() {
  cd $_gitname
  make DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
