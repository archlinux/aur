# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_reponame=RcloneShuttle
pkgname=rclone-shuttle
pkgver=0.1.9
pkgrel=1
pkgdesc='Upload your files to anywhere - GTK4 GUI for Rclone'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/pieterdd/RcloneShuttle'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'rclone')
makedepends=('rust')
options=('!debug')
source=("${pkgname}-${pkgver//+/-}.tar.gz::https://github.com/pieterdd/${_reponame}/archive/refs/tags/${pkgver//+/-}.tar.gz")
b2sums=('b4bac4192e73639d74ba39011a6427c7788d0eaa1adcb2246739fda7d323b26eecb0dbb757da551e5b7f6eedc5e695e537cd5d94e38bf936a8e00a0c020c102b')

prepare() {
  cd "${_reponame}-${pkgver//+/-}"
  cargo fetch --locked
}

build() {
  cd "${_reponame}-${pkgver//+/-}"
  cargo build --frozen --release --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${_reponame}-${pkgver//+/-}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # resources
  install -Dm644 "${srcdir}/${_reponame}-${pkgver//+/-}/meta/io.github.pieterdd.RcloneShuttle.desktop" \
    "${pkgdir}/usr/share/applications/io.github.pieterdd.RcloneShuttle.desktop"
  install -Dm644 "${srcdir}/${_reponame}-${pkgver//+/-}/meta/io.github.pieterdd.RcloneShuttle.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.pieterdd.RcloneShuttle.svg"
  # readme
  install -Dm644 "${srcdir}/${_reponame}-${pkgver//+/-}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
