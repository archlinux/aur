# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Cookie Engineer <cookiengineer@protonmail.ch>
# Contributor: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=librewolf-extension-darkreader
pkgver=4.9.126
pkgrel=1
pkgdesc='Dark mode for every website. Take care of your eyes, use dark theme for night and daily browsing'
url="https://github.com/darkreader/darkreader"
arch=('any')
license=('MIT')
depends=('librewolf')
makedepends=('git' 'npm' 'strip-nondeterminism')
groups=('librewolf-addons')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fa039a5b3e0908f6db7faddd8b43fb9d96135e4d39578c52884ba8a18a3f150b')

prepare() {
  export npm_config_cache="$srcdir/npm_cache"
  cd darkreader-$pkgver
  npm ci
}

build() {
  export npm_config_cache="$srcdir/npm_cache"
  cd darkreader-$pkgver
  npm run release
  strip-nondeterminism -t zip build/release/*.xpi
}

package() {
  cd darkreader-$pkgver
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 build/release/darkreader-firefox.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/addon@darkreader.org.xpi"
}
