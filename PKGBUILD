# Maintainer: Yuval Adam <yuv dot adm at gmail dot com> PGP-Key: CC2115C12D99D2F0

pkgname=micronucleus-git
pkgver=2.01.r13.gb23ba5b
pkgrel=1
pkgdesc="ATTiny usb bootloader with a strong emphasis on bootloader compactness"
arch=('any')
url="https://github.com/micronucleus/micronucleus"
license=(GPL)
provides=('micronucleus')
source=("git+$url")
sha1sums=('SKIP')
_gitname=micronucleus

pkgver() {
  cd $_gitname
  git describe --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname/commandline"
  make
}

package() {
  cd "${srcdir}/${_gitname}/commandline"
  install -Dm755 micronucleus "${pkgdir}/usr/bin/micronucleus"
  install -Dm644 49-micronucleus.rules "${pkgdir}/etc/udev/rules.d/49-micronucleus.rules"
}

# vim:set ts=2 sw=2 et:
