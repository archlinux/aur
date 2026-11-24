# Maintainer: agony <27015 at riseup dot net>

pkgname=safe-chain-bin
pkgver=1.5.29
pkgrel=1
pkgdesc='Protect against malicious code installed via npm, yarn, pnpm, pip, uv and poetry (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/AikidoSec/safe-chain'
license=('AGPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++')
optdepends=('npm: wrap npm and npx'
            'yarn: wrap yarn'
            'pnpm: wrap pnpm and pnpx'
            'bun: wrap bun and bunx'
            'python-pip: wrap pip'
            'python-pipx: wrap pipx'
            'uv: wrap uv and uvx'
            'python-poetry: wrap poetry'
            'python-pdm: wrap pdm')
provides=("safe-chain=${pkgver}")
conflicts=('safe-chain')
options=('!strip' '!debug')
_release="${url}/releases/download/${pkgver}"
source_x86_64=("safe-chain-${pkgver}-linux-x64::${_release}/safe-chain-linux-x64")
source_aarch64=("safe-chain-${pkgver}-linux-arm64::${_release}/safe-chain-linux-arm64")
sha256sums_x86_64=('1b8f655b02ae5e362d28087987e5d88d1c9d58e8bf9773275a2ecf95adcd7903')
sha256sums_aarch64=('6f5e1e43877756ab1ad2590aeff859c61be19ec4e4ac30f9b6b646f532579c92')

package() {
  install -Dm755 safe-chain-"${pkgver}"-linux-* "${pkgdir}/usr/lib/safe-chain/safe-chain"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/safe-chain/safe-chain "${pkgdir}/usr/bin/safe-chain"
}
