pkgname=coreos-cloudinit-git
pkgver=1.9.2.r0.g6e9109e
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
sha256sums=('SKIP' 'b2fc8da498f3a87e4ba3ea6422cb006f1195e0281b2b062a6b2805b3c035fcb2')
optdepends=('update-ssh-keys: ssh key management support')

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
