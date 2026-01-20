# Maintainer: Terromur <terromuroz@proton.me>
pkgname=hytale-f2p-git
_pkgname=hytale-f2p
pkgver=2.0.2.r104.g5e3506a
pkgrel=1
pkgdesc="HyLauncher - unofficial Hytale Launcher for free to play gamers"
arch=('x86_64')
url="https://github.com/amiayweb/Hytale-F2P"
license=('custom')
makedepends=('npm')
source=("git+$url.git" "Hytale-F2P.desktop")
sha256sums=('SKIP'
  '8c78a6931fade2b0501122980dc238e042b9f6f0292b5ca74c391d7b3c1543c0')

pkgver() {
  cd "$_pkgname"
  printf "2.0.2.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  npm install
  npm run build:linux
}

package() {
  mkdir -p "$pkgdir/opt/$_pkgname"
  cp -r "$_pkgname/dist/linux-unpacked/"* "$pkgdir/opt/$_pkgname"
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
}
