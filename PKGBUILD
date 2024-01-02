# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=framework-laptop-kmod-dkms-git
_pkgbase=framework-laptop-kmod
pkgver=r17.a9e8db9
pkgrel=1
pkgdesc="Kernel module to expose more Framework Laptop stuff"
arch=(x86_64)
url="https://github.com/DHowett/framework-laptop-kmod"
license=('GPL')
depends=('dkms')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('framework-laptop-kmod::git+https://github.com/DHowett/framework-laptop-kmod')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgbase}"

  # Copy sources (including Makefile)
  for f in ./*; do
    install -Dm644 "$f" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/$f"
  done
}
