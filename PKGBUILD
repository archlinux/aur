# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=easyssh
pkgver=1.7.1
pkgrel=1
pkgdesc="SSH connection manager for Pantheon"
arch=(x86_64)
url="https://github.com/muriloventuroso/easyssh"
license=(GPL3)
depends=(libgranite.so gtk3 vte3)
makedepends=(vala meson ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/muriloventuroso/easyssh/archive/${pkgver}.tar.gz"
        "https://dev.getsol.us/file/data/j3xcc4frwhf7o7oj5b7q/PHID-FILE-xz47xj55kglr3mr7kyig/files_utf8.patch")
sha256sums=('d81ff91aa23be9a29eddf41d4fb9bb5ed0282d513683506f6011f56058053bbf'
            'f5b4a7406b61d6f777abdfab6141cbf917ee469c49bac2445bb6d704cb82461f')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ../files_utf8.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson build --prefix=/usr -D libunity=false -D ubuntu-bionic-patched-vte=false
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
