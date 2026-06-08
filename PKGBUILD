# Maintainer: LeafEvans <https://github.com/leafevans>

pkgname=sshuttlee
pkgver=26.0.0
pkgrel=3
pkgdesc="Lightweight, fast and beautiful SSH + SFTP client"
arch=('x86_64')
url="https://github.com/sshuttlee/sshuttlee"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'openssl' 'libssh2')
makedepends=('cargo' 'pnpm' 'nodejs' 'pkgconf' 'librsvg')
conflicts=('sshuttlee-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sshuttlee/sshuttlee/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('91ac686db5c9266985b5ec854af43706a90712ea14ea6d8530b37757a0b310b6')

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
