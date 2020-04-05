# Maintainer: x70b1

pkgname=pam_exec-ssh
pkgver=r11.50fe297
pkgrel=3
pkgdesc="Unlock SSH keys on login using PAM"
arch=(any)
url="https://github.com/x70b1/pam_exec-ssh"
license=("The Unlicense")
makedepends=("git")
depends=("pam" "expect")
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  set -o pipefail
  git describe --long 2> /dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname}
  install -Dm755 pam_exec-ssh "${pkgdir}"/usr/bin/pam_exec-ssh
}
