# Maintainer: spyophobia <76800505+spyophobia@users.noreply.github.com>

pkgname=shadowsocks-gtk-rs
pkgver=0.3.1
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
sha512sums=('6600e388092bf441259f3015fbe15719b985243b914fb4f3a8c938a59c449b6af690d893ca8543a6214385f829bc90e2bec3bb5a2534d108e5fe39b37e915b9c')

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
}
