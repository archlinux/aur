# Maintainer: LeafEvans <https://github.com/leafevans>

pkgname=sshuttlee
pkgver=26.1.0
pkgrel=1
pkgdesc="Lightweight, fast and beautiful SSH + SFTP client"
arch=('x86_64')
url="https://github.com/sshuttlee/sshuttlee"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'openssl' 'libssh2')
makedepends=('cargo' 'pnpm' 'nodejs' 'pkgconf' 'librsvg')
conflicts=('sshuttlee-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sshuttlee/sshuttlee/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c52e4778d4c0e7164575bd2821d45f9467ed784603ce157365b490ab70fab5b9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  pnpm install --frozen-lockfile --ignore-scripts
  pnpm tauri build --no-bundle --ci
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 src-tauri/target/release/sshuttlee "${pkgdir}/usr/bin/sshuttlee"
  install -Dm644 assets/sshuttlee.desktop "${pkgdir}/usr/share/applications/sshuttlee.desktop"
  install -Dm644 src-tauri/icons/128x128@2x.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/sshuttlee.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
