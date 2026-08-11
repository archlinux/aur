# Maintainer: Evilleader evilleader91@gmail.com
pkgname=optiscaler-client-bin
pkgver=1.0.6
pkgrel=3
pkgdesc="A modern manager for OptiScaler"
arch=('x86_64')
url="https://github.com/Optiscaler-Client/Optiscaler-Client"
license=('GPL3')
depends=('fontconfig' 'libx11' 'libice' 'libsm')
provides=('optiscaler-client')
conflicts=('optiscaler-client')
options=(!strip)
source=(
  "optiscaler-client.zip::https://github.com/Optiscaler-Client/Optiscaler-Client/releases/download/OptiscalerClient-${pkgver}/OptiscalerClient-${pkgver}-linux-x64.zip"
  "optiscaler-client.png::https://raw.githubusercontent.com/Optiscaler-Client/Optiscaler-Client/OptiscalerClient-${pkgver}/assets/icon.png"
  "optiscaler-client.desktop"
)
# These are placeholders only. They are overwritten automatically every
# deploy by `updpkgsums: true` in deploy.yml (KSXGitHub/github-actions-deploy-aur).
# Do NOT use 'SKIP' here -- 'SKIP' tells updpkgsums to leave that entry
# untouched, which is exactly the "skipped verification" behavior that got
# flagged. Any non-SKIP placeholder works since it's always replaced.
sha256sums=('775a1834874428d8b262a4b6820de49629073e6d3c5a7f3641e1fd8d48d9a678'
            '6cbd9f7a125322895f5d2081c274a24580ea4c499e96e7c0624174b41f5abe06'
            '1fee9e445e1633a393d5cb27b415dbf432aa2d6195fcd92b8e05cd79fe6bf955')

package() {
  mkdir -p "$pkgdir/opt/optiscaler-client"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  bsdtar -xf optiscaler-client.zip -C "$pkgdir/opt/optiscaler-client"
  chmod +x "$pkgdir/opt/optiscaler-client/OptiscalerClient"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/optiscaler-client" << 'EOF'
#!/bin/bash
exec /opt/optiscaler-client/OptiscalerClient "$@"
EOF
  install -Dm644 optiscaler-client.desktop \
    "$pkgdir/usr/share/applications/optiscaler-client.desktop"
  install -Dm644 optiscaler-client.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/optiscaler-client.png"
}
