# Maintainer: isaacangello <isaacangello@inf.ufpell.edu.br>
# Binários standalone do Bun (~100 MB por arquitetura), publicados no GitHub Releases.
pkgname=nimsync-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Sync free-first AI provider models (NVIDIA NIM, Google AI Studio, Groq, OpenRouter, AIHubMix, custom) with the OpenCode model whitelist"
arch=('x86_64' 'aarch64')
url="https://github.com/isaacangello/nimsync"
license=('MIT')
depends=('glibc')
options=('!strip') # preserva o payload embutido nos binários compilados pelo Bun
provides=('nimsync')
conflicts=('nimsync')
_url="https://github.com/isaacangello/nimsync/releases/download/v${pkgver}"
source=("nimsync-LICENSE-${pkgver}::https://raw.githubusercontent.com/isaacangello/nimsync/v${pkgver}/LICENSE")
sha256sums=('75cdde8fdba948258a170beb8095fac4a0967a04e213d51a58eaafdd78c3f9ac')
source_x86_64=("${_url}/nimsync-${pkgver}-linux-x64")
source_aarch64=("${_url}/nimsync-${pkgver}-linux-arm64")
sha256sums_x86_64=('da8bdd5a997791f99d42158a40ac4da1baee43a5fd4e5b442d5d99b4925e035f')
sha256sums_aarch64=('a9a9fd0c70f681adbb6a0b1c38d986bd2e1d6254c213fcc4dee0ccc5141dd308')

case "${CARCH}" in
  x86_64) _bin="nimsync-${pkgver}-linux-x64" ;;
  aarch64) _bin="nimsync-${pkgver}-linux-arm64" ;;
esac

package() {
  install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/nimsync"
  install -Dm644 "${srcdir}/nimsync-LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
