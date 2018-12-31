# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=coinmon
pkgver=0.0.22
pkgrel=1
pkgdesc='Cryptocurrency price monitoring tool'
arch=('any')
url=https://github.com/bichenkk/coinmon
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/coinmon/-/coinmon-$pkgver.tgz")
noextract=("${source[@]##*/}")
sha512sums=('2222f96db8ac9d9e14dc854d9f797967c77546743dcafcd6ba100953956d486a1e61f7429fb8d49658b01f4daf6853928200e432829d87c7a1e8e960aa632eea')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr --ignore-scripts --production coinmon-$pkgver.tgz

  cd "$pkgdir"
  mkdir -p usr/share/licenses/coinmon
  mv usr/lib/node_modules/coinmon/LICENSE usr/share/licenses/coinmon/
  rm usr/lib/node_modules/coinmon/{.,}* || true
  chmod 755 usr/bin
  find usr/lib/node_modules -type d -exec chmod 755 {} +
}

# vim:set ts=2 sw=2 et:
