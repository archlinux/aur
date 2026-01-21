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
            '46488fada4775d9976d7b7b62f8d1f1f8d9a9a9d8f8aa9af4f2e2153019f6a30')

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
