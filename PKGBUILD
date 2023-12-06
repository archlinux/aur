# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Cookie Engineer <cookiengineer@protonmail.ch>
# Contributor: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=librewolf-extension-darkreader
pkgver=4.9.73
pkgrel=1
pkgdesc='Dark mode for every website. Take care of your eyes, use dark theme for night and daily browsing'
url=https://github.com/darkreader/darkreader
arch=('any')
license=('MIT')
depends=('librewolf')
makedepends=('git' 'npm' 'strip-nondeterminism')
groups=('librewolf-addons')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd darkreader
  npm ci
}

build() {
  cd darkreader
  npm run build
  strip-nondeterminism -t zip build/release/*.xpi
}

package() {
  cd darkreader
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 build/release/darkreader-firefox.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/addon@darkreader.org.xpi"
}
