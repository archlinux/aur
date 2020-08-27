# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=easyssh
pkgver=1.7.2
pkgrel=1
pkgdesc="SSH connection manager for Pantheon"
arch=(x86_64)
url="https://github.com/muriloventuroso/easyssh"
license=(GPL3)
depends=(libgranite.so gtk3 vte3)
makedepends=(vala meson ninja)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/muriloventuroso/easyssh/archive/${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/easyssh-files_utf8.patch")
sha256sums=('c9c5dae036fda6b1410a36308640525fc61479d61201dda919f41d2705272d7c'
            'f5b4a7406b61d6f777abdfab6141cbf917ee469c49bac2445bb6d704cb82461f')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ../easyssh-files_utf8.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson build --prefix=/usr -D libunity=false -D ubuntu-bionic-patched-vte=false
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -s /usr/bin/com.github.muriloventuroso.easyssh "${pkgdir}/usr/bin/easyssh"
}
