# Maintainer: Oliver Ford <dev.aur@ojford.com>

pkgname=cyberark-summon
pkgver=0.8.3
pkgrel=4
pkgdesc='CLI that provides on-demand secrets access for common DevOps tools'
arch=('x86_64' 'i686')
url='https://github.com/cyberark/summon'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cyberark/summon/releases/download/v${pkgver}/summon-linux-amd64.tar.gz")
sha256sums=('fc0e0feaf6ef4fb641a41762a2c76d1a282fec3f852e1141af6e3f8ab24f074f')

conflicts=(
    'summon'
)
optdepends=(
    'gopass: to use (go)pass as a provider'
)

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  tar -xzf $pkgname-$pkgver.tar.gz -C "${pkgdir}/usr/bin/"
  chmod 0755 "${pkgdir}/usr/bin/summon"

  mkdir -p "${pkgdir}/usr/local/lib/summon/"
  if [ -f /usr/bin/gopass ]; then
    ln -s /usr/bin/gopass-summon-provider "$pkgdir/usr/local/lib/summon/gopass"
  fi
}
