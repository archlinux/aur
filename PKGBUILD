# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Cookie Engineer <cookiengineer@protonmail.ch>
# Adapted by dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=('librewolf-extension-dark-reader')
pkgver=4.9.39
pkgrel=1
pkgdesc='Inverts brightness of web pages and aims to reduce eyestrain while browsing the web'
url=https://darkreader.org/
arch=('any')
license=('MIT')
makedepends=('npm')
source=("https://github.com/darkreader/darkreader/archive/v$pkgver/darkreader-v$pkgver.tar.gz")
b2sums=('8638de5851ddbbf58bc7c30a403f92651811fa1fcba3ac1d99fd32bdddb36f0947c3a85eebd8a89207d51b529a9993660fb6d9df935e8d97b03fc30bc0750d4e')

build() {
  cd darkreader-$pkgver
  npm install --frozen-lockfile
  npm run build
}

check() {
  cd darkreader-$pkgver
  npm test
}

package() {
  groups=('librewolf-addons')
  cd darkreader-$pkgver
  install -Dm644 build-firefox.xpi \
    "$pkgdir"/usr/lib/librewolf/browser/extensions/addon@darkreader.org.xpi
}
