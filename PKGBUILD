# Maintainer: Oliver Ford <dev.aur@ojford.com>

pkgname=cyberark-summon
pkgver=0.10.4
pkgrel=1
pkgdesc='CLI that provides on-demand secrets access for common DevOps tools'
arch=('x86_64' 'i686')
url='https://github.com/cyberark/summon'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cyberark/summon/releases/download/v${pkgver}/summon-linux-amd64.tar.gz")
sha256sums=('f9756f7c17d2c2db9aa61ddf4910e0468b59bac24e0023c638b91f05f96a296a')

conflicts=(
    'summon'
)
optdepends=(
    'gopass: to use (go)pass as a provider'
)

package() {
  set -eu

  mkdir -p "${pkgdir}/usr/bin/"
  tar -xzf $pkgname-$pkgver.tar.gz -C "${pkgdir}/usr/bin/"
  chmod 0755 "${pkgdir}/usr/bin/summon"

  mkdir -p "${pkgdir}/usr/local/lib/summon/"
  if [ -f /usr/bin/gopass ]; then
    ln -s /usr/bin/gopass-summon-provider "$pkgdir/usr/local/lib/summon/gopass"
  fi
}
