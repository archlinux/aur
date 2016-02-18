pkgname=coreos-cloudinit-git
pkgver=1.9.0.r3.g8fa2641
pkgrel=1
pkgdesc="coreos-cloudinit"
arch=('x86_64')
url="https://github.com/coreos/coreos-cloudinit"
license=(apache)
makedepends=('go')
provides=('coreos-cloudinit')
replaces=('cloud-init' 'coreos-cloudinit' 'coreos-cloudinit-git')
conflicts=('cloud-init' 'coreos-cloudinit' 'coreos-cloudinit-git')
source=("$pkgname::git+$url" "coreos-cloudinit.service")
sha256sums=('SKIP' '21e08ced41942ffb0ce8371f6efc6fa1c6941da777d8798ae03b7bfd9479bc1d')

pkgver() {
  cd "$pkgname"
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  ./build
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  cp ${pkgname}/bin/* ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/etc/systemd/system/multi-user.target.wants
  cp coreos-cloudinit.service ${pkgdir}/etc/systemd/system/multi-user.target.wants
}

# vim:set ts=2 sw=2 et:
