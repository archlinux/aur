# Maintainer: onurmercury <onurmercury at proton dot me>
# Contributor: Sick Codes <info at sick dot codes>
# Contributor: Tobias Martin <tm-x at gmx dot net>

# This package includes the Binder module, sourced from @choff's anbox-modules fork.
# However, it differs from the repository by excluding
# the ashmem module, as both the Linux kernel (version 5.18)
# and Waydroid (version 1.2.1) now utilize memfd instead.

_pkgname=binder_linux-dkms

pkgname="${_pkgname}-git"
pkgver=r52.13a93a4
pkgrel=1
arch=("x86_64")
url="https://github.com/choff/anbox-modules"
pkgdesc="Binder kernel module for Waydroid."
license=("GPL2")
conflicts=("${_pkgname}" "anbox-modules-dkms")
depends=("dkms")
makedepends=("git")
source=(git+"${url}".git)
sha512sums=("SKIP")

pkgver() {
  cd anbox-modules
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  install -dm755 "${pkgdir}/usr/src/binder-1"
  cp -r "${srcdir}/anbox-modules/binder/"* "${pkgdir}/usr/src/binder-1/"
}
