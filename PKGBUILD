# Maintainer: en3 <ivanyalyshev@yandex.ru>
pkgname=planner-app
pkgver=1.1.0
pkgrel=1
pkgdesc="Clean weekly planner desktop app built with Next.js and Tauri"
arch=("x86_64")
url="https://gitflic.ru/project/en3/planner-app"
license=("MIT")
depends=("webkit2gtk-4.1" "gtk3" "libayatana-appindicator")
makedepends=("git" "nodejs" "npm" "rust" "cargo")
source=("git+https://gitflic.ru/project/en3/planner-app.git#tag=v${pkgver}")
sha256sums=("SKIP")

build() {
  cd "${srcdir}/${pkgname}"
  npm ci
  npm run tauri:build -- --no-bundle
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 "src-tauri/target/release/planner-app" "${pkgdir}/usr/bin/planner-app"
  install -Dm644 "src-tauri/icons/icon.png" "${pkgdir}/usr/share/pixmaps/planner-app.png"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/planner-app.desktop" <<EOF
[Desktop Entry]
Name=Planner App
Comment=Weekly planner
Exec=planner-app
Icon=planner-app
Terminal=false
Type=Application
Categories=Utility;Office;
StartupNotify=true
EOF
}
