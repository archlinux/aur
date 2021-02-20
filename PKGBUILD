# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=arch-audit-gtk
pkgver=0.1.0
pkgrel=1
pkgdesc='Arch Linux Security Update Notifications'
url='https://github.com/kpcyrd/arch-audit-gtk'
arch=('x86_64')
license=('GPL3')
depends=('arch-audit' 'libappindicator-gtk3')
makedepends=('cargo' 'clang' 'llvm')
source=(https://github.com/kpcyrd/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('775fd20de96ddd8fdd33b38e7b3625681d6af51b9f789beeb63e30d6aa65467db0898e47ce674a5ca0df2593d29aeac5cd9d24777bfbd5d940a6643d92d8431c')
b2sums=('720728a8f9b0b966b1deaa07697eefc72e188682ef09e4caca7bd4a7baefe07400d19c842ebb28751c7eb840c52e19512443e0ade751c8528068c4cf6a47203a')

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --locked
}

check() {
  cd ${pkgname}-${pkgver}
  cargo test --release --locked
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm 644 icons/*.svg -t "${pkgdir}/usr/share/arch-audit-gtk/icons"
  install -Dm 644 contrib/arch-audit-gtk.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/arch-audit-gtk.conf"
  install -Dm 644 contrib/arch-audit-gtk.hook "${pkgdir}/usr/share/libalpm/hooks/arch-audit-gtk.hook"
  install -Dm 644 contrib/arch-audit-gtk.desktop -t "${pkgdir}/etc/xdg/autostart"
}

# vim: ts=2 sw=2 et:
