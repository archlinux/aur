# Maintainer: agony <27015 at riseup dot net>

pkgname=safe-chain-bin
pkgver=1.5.30
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
sha256sums_x86_64=('3ccb658526091bfc45fbd6a538206ab907944515f3712e32021eb039698a32c8')
sha256sums_aarch64=('2f42b9a2841ad52ed928b5331fda8ceb44dc9e781b601aca61e3774d8a1b01a4')

package() {
  install -Dm755 safe-chain-"${pkgver}"-linux-* "${pkgdir}/usr/lib/safe-chain/safe-chain"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/safe-chain/safe-chain "${pkgdir}/usr/bin/safe-chain"
}
