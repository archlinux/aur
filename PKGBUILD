# Maintainer: Heating Device <via DoT heatingdevice OT me DuT co m>
pkgname=tigcap
pkgver=latest
pkgrel=1
pkgdesc="A powerful screenshot tool"
arch=('x86_64' 'armv7h')
url="https://github.com/theimgguru/tigcap/"
license=('GPL')
groups=()
depends=(maim)
makedepends=(npm nodejs git)
optdepends=('libnotify: Notification support')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/theimgguru/tigcap.git)
noextract=()
sha1sums=('SKIP')

build() {
  cd "$pkgname"

  npm install
}

package() {
  cd "$pkgname"

  node_modules/.bin/electron-packager . TIGCap --no-prune --out out --asar --overwrite
  mkdir -p $pkgdir/opt/tigcap

  cp -dr --no-preserve=ownership out/TIGCap-linux-*/* "$pkgdir/opt/tigcap"
  mkdir -p "$pkgdir/usr/share/applications"
  install TIGCap.desktop "$pkgdir/usr/share/applications"
}
