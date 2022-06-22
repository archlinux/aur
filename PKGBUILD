# Maintainer: spyophobia <76800505+spyophobia@users.noreply.github.com>

pkgname=shadowsocks-gtk-rs
pkgver=0.3.0
pkgrel=2
pkgdesc="A desktop GUI frontend for shadowsocks-rust client implemented with gtk-rs."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/spyophobia/shadowsocks-gtk-rs"
license=("GPL3")
conflicts=("shadowsocks-gtk-rs-bin" "shadowsocks-gtk-rs-git")
depends=("gtk3" "hicolor-icon-theme" "libappindicator-gtk3")
makedepends=("cargo")
optdepends=(
    'shadowsocks-rust: the default shadowsocks backend implementation'
)
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('edd34c98391b528b281158d52d965f9239a015f5efe57e509574a2cf67c52216da53a5ecbe484a9d2904ffb07ad0f10ec59c84ff4546e24808b66d3ef14f9bb8')

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
  install -Dm 644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps" res/logo/shadowsocks-gtk-rs.svg
}
