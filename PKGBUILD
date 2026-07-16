# Maintainer: willymdv <willymdv@gmail.com>

_pkgbase=amd_pmc
pkgname=amd_pmc-ideapad-dkms-git
pkgver=r20.99f0d01
pkgrel=1
pkgdesc="AMD PMC kernel module patched to fix keyboard/lid switch broken after suspend on Lenovo IdeaPad Slim 3 AMD laptops (DKMS)"
arch=('x86_64')
url="https://github.com/DanielGibson/amd_pmc-ideapad"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
provides=('amd_pmc-ideapad-dkms')
conflicts=('amd_pmc-ideapad-dkms')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd amd_pmc-ideapad
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd amd_pmc-ideapad
  install -Dm644 -t "$pkgdir/usr/src/$_pkgbase-$pkgver/" \
    dkms.conf Makefile pmc.c pmc.h pmc-quirks.c mp1_stb.c mp2_stb.c
  sed -i "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"$pkgver\"/" \
    "$pkgdir/usr/src/$_pkgbase-$pkgver/dkms.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
