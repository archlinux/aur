# Maintainer: Evilleader evilleader91@gmail.com
pkgname=optiscaler-client-bin
pkgver=1.0.6
pkgrel=2
pkgdesc="Modern desktop client for installing, updating and configuring OptiScaler across game libraries"
arch=('x86_64')
url="https://github.com/Optiscaler-Client/Optiscaler-Client"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('optiscaler-client')
conflicts=('optiscaler-client')
options=(!strip)
source=(
  "optiscaler-client.zip::https://github.com/Optiscaler-Client/Optiscaler-Client/releases/download/OptiscalerClient-${pkgver}/OptiscalerClient-${pkgver}-linux-x64.zip"
  "optiscaler-icon-256.png::https://raw.githubusercontent.com/NasirA1991/aur-optiscaler-client/main/icon256.png"
  "optiscaler-icon-128.png::https://raw.githubusercontent.com/NasirA1991/aur-optiscaler-client/main/icon128.png"
  "optiscaler-client.desktop"
)
# These are placeholders only. They are overwritten automatically every
# deploy by `updpkgsums: true` in deploy.yml (KSXGitHub/github-actions-deploy-aur).
# Do NOT use 'SKIP' here -- 'SKIP' tells updpkgsums to leave that entry
# untouched, which is exactly the "skipped verification" behavior that got
# flagged. Any non-SKIP placeholder works since it's always replaced.
sha256sums=('775a1834874428d8b262a4b6820de49629073e6d3c5a7f3641e1fd8d48d9a678'
            'a090cf7fb9f449ece427a965a56a876e664b1b3fdc818dec6346707bf7d29f67'
            '4a034f30f6430428921038f6f7c36a93d35f82197e0f6e004697583b3b8d10c9'
            '1fee9e445e1633a393d5cb27b415dbf432aa2d6195fcd92b8e05cd79fe6bf955')

package() {
  mkdir -p "$pkgdir/opt/optiscaler-client"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  bsdtar -xf optiscaler-client.zip -C "$pkgdir/opt/optiscaler-client"
  chmod +x "$pkgdir/opt/optiscaler-client/OptiscalerClient"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/optiscaler-client" << 'EOF'
#!/bin/bash
exec /opt/optiscaler-client/OptiscalerClient "$@"
EOF
  install -Dm644 optiscaler-client.desktop \
    "$pkgdir/usr/share/applications/optiscaler-client.desktop"
  install -Dm644 optiscaler-icon-256.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/optiscaler-client.png"
  install -Dm644 optiscaler-icon-128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/optiscaler-client.png"
}
