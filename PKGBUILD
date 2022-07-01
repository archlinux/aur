# Maintainer: spyophobia <76800505+spyophobia@users.noreply.github.com>

pkgname=shadowsocks-gtk-rs
pkgver=0.4.0
pkgrel=1
pkgdesc="A desktop GUI frontend for shadowsocks-rust client implemented with gtk-rs."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/spyophobia/shadowsocks-gtk-rs"
license=("GPL3")
conflicts=("shadowsocks-gtk-rs-bin" "shadowsocks-gtk-rs-git")
depends=("gtk3" "hicolor-icon-theme" "libappindicator-gtk3")
makedepends=("cargo")
optdepends=(
    'shadowsocks-rust: the default shadowsocks backend implementation'
    'gnome-shell-extension-appindicator: tray icon support on Gnome Desktop'
)
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('7aeed51adecdd1c6771194e7a19783b171aa689bb4d7ccc67f9481e43ca08329b1337026e626791d8c3d07cd0d57d3f6969def0346fd4102d022f726968128ce')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --locked
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 -t "${pkgdir}/usr/bin" target/release/ssgtk target/release/ssgtkctl
  install -Dm 644 -t "${pkgdir}/usr/share/applications" res/shadowsocks-gtk-rs.desktop
  install -Dm 644 -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps" res/logo/shadowsocks-gtk-rs.png

  install -Dm 755 -d "${pkgdir}/usr/share/shadowsocks-gtk-rs"
  cp -r example-profiles/Group-of-good-profiles "${pkgdir}/usr/share/shadowsocks-gtk-rs/example-profiles"
}
