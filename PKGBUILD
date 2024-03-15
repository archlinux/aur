# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=pgweb-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Web-based PostgreSQL database browser written in Go"
arch=(x86_64 aarch64)
url="https://github.com/sosedoff/pgweb"
license=('MIT')
provides=("pgweb=${pkgver}")
conflicts=("pgweb")
source=('pgweb.install' 'pgweb.env' 'pgweb.service' 'bookmark.toml.sample')
source_x86_64=("bin_${pkgver}_amd64.zip::https://github.com/sosedoff/pgweb/releases/download/v${pkgver}/pgweb_linux_amd64.zip")
source_aarch64=("bin_${pkgver}_arm64.zip::https://github.com/sosedoff/pgweb/releases/download/v${pkgver}/pgweb_linux_arm64.zip")
sha256sums=('cc041317281beafc22ad7dd47f3f3ae3ca5006a3f873996bc611124fc3d439d0'
            'aa58ad72a5ea730b4c2ae292e02608d3df2b882c173520737fa4afb0faa89f29'
            'fd97b0358d87659770b8a4289d35bd9c02607807fdd53e09447829661dea7b1d'
            '5eae680e816a8124f0b227da33bf90637730a5ef2b32267b89344369f866c609')
sha256sums_x86_64=('dece04583920594c6c0d5b12f7b2c23eb64ce0fd171ed8a9dae5e16712f7c7e7')
sha256sums_aarch64=('757c9b7a720b49b57866a84bbaafc4733e93572e2cda8247041cbb7d907f553e')

backup=('etc/conf.d/pgweb')
install='pgweb.install'

package() {
  cd "$srcdir"
  install -Dm644 pgweb.env "$pkgdir"/etc/conf.d/pgweb
  install -Dm644 pgweb.service "$pkgdir"/usr/lib/systemd/system/pgweb.service

  install -dm700 "$pkgdir"/etc/pgweb
  install -Dm644 bookmark.toml.sample "$pkgdir"/etc/pgweb/bookmark.toml.sample

  install -Dm755 pgweb_linux_* "$pkgdir"/usr/bin/pgweb
}
