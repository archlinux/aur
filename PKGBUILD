# Maintainer: spyophobia <76800505+spyophobia@users.noreply.github.com>

pkgname=shadowsocks-gtk-rs
pkgver=0.4.1
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
sha512sums=('5887dd93913b54a3735223e8c3e193998295781a58e208084f4148c957c2d9490e7c7f7571a31a402107511a0ecc05c06b9472caf646ad2b52e6257268894c14')

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
