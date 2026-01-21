# Maintainer: Terromur <terromuroz@proton.me>
# Maintainer: 00ein00
pkgname=hytale-f2p-git
_pkgname=Hytale-F2P
pkgver=2.0.2b.r143.g1c779e0
pkgrel=1
pkgdesc="Hytale-F2P - unofficial Hytale Launcher for free to play with multiplayer support"
arch=('x86_64')
url="https://github.com/amiayweb/Hytale-F2P"
license=('custom')
makedepends=('npm' 'jq' 'git' 'libxcrypt-compat' 'nodejs' 'electron-builder')
provides=('hytale-f2p-git')
conflicts=('Hytale-F2P-git')
replaces=('Hytale-F2P-git')
source=("git+$url.git" "Hytale-F2P.desktop")
sha256sums=('SKIP'
            '8c78a6931fade2b0501122980dc238e042b9f6f0292b5ca74c391d7b3c1543c0')

pkgver() {
  cd "$_pkgname"
  printf "2.0.2b.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  npm install
  npm run build:linux -- dir
}

package() {
  mkdir -p "$pkgdir/opt/$_pkgname"
  cp -r "$_pkgname/dist/linux-unpacked/"* "$pkgdir/opt/$_pkgname"
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
}
