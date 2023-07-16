# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Cookie Engineer <cookiengineer@protonmail.ch>
# Adapted by dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=librewolf-extension-dark-reader
pkgver=4.9.64
pkgrel=1
pkgdesc='Inverts brightness of web pages and aims to reduce eyestrain while browsing the web'
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
  install -Dm644 build/release/darkreader-firefox.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/addon@darkreader.org.xpi"
}
