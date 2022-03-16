# Maintainer: Oliver Ford <dev.aur@ojford.com>

pkgname=cyberark-summon
pkgver=0.9.1
pkgrel=1
pkgdesc='CLI that provides on-demand secrets access for common DevOps tools'
arch=('x86_64' 'i686')
url='https://github.com/cyberark/summon'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cyberark/summon/releases/download/v${pkgver}/summon-linux-amd64.tar.gz")
sha256sums=('fc53167b12bea5003e3c6177ad08a0b98c3f9e12145f0b3187a440afeffa064b')

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
