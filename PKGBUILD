# Maintainer: claymorwan <claymorwan@proton.me> <claymorw@gmail.com>

_sourceName="ElisaRPC"
_exeName="elisa_rpc"

pkgname=elisarpc-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A Discord rich presence client for Elisa the music player by KDE. Made by  renarin-kholin."
arch=("x86_64")
url="https://github.com/renarin-kholin/ElisaRPC"
source=("git+${url}")
sha256sums=('SKIP')
license=("MIT")
depends=("playerctl")
makedepends=("git" "cargo")
conflicts=("$_sourceName")
provides=("$_sourceName")

build() {
  cd "$_sourceName"
  cargo build --release
  chmod +x ./target/release/elisa_rpc
}

package() {
  install -Dm644 "$_sourceName/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$_sourceName/target/release/$_exeName" -t "$pkgdir/usr/bin"

  install -Dm0644 /dev/stdin "$pkgdir/usr/share/applications/$_sourceName.desktop" << EOF
[Desktop Entry]
Name=${_sourceName}
Exec=/usr/bin/${_exeName}
Terminal=false
X-Autostart-enabled=true
EOF
}
