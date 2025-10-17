# Maintainer: TheDL98 <ahmed at thedl98 dot com>
# Contributor: solarbaron
# Contributor: Dlani
pkgname=feishin
pkgver=0.21.2
pkgrel=1
pkgdesc='A modern self-hosted music player.'
arch=('x86_64' 'aarch64')
url='https://github.com/jeffvli/feishin'
license=('GPL-3.0-only')
makedepends=('pnpm' 'git')
optdepends=('mpv: Alternative audio backend')
conflicts=('feishin-git' 'feishin-bin')
source=("git+${url}.git#tag=v${pkgver}"
	"feishin.desktop")
sha256sums=('SKIP'
	'17f4e5c319e625198ffe2032045657e0d33db1d9d64f534bfc2d40f6082fd5db')

build() {
  pnpm cache delete
  cd $pkgname
  pnpm install
  pnpm run package
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  cp -r "$pkgname/dist/linux-unpacked/"* "$pkgdir/usr/share/$pkgname"
  install -Dm644 "$pkgdir/usr/share/feishin/resources/assets/icons/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname%}.png"
  ln -s /usr/share/feishin/feishin "${pkgdir}/usr/bin/feishin"
  install -Dm644 feishin.desktop "$pkgdir/usr/share/applications/"
}
