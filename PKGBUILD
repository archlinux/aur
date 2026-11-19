# Maintainer: isaacangello <isaacangello@inf.ufpell.edu.br>
# Binários standalone do Bun (~100 MB por arquitetura), publicados no GitHub Releases.
pkgname=nimsync-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Sync NVIDIA NIM and free AIHubMix models with the OpenCode model whitelist"
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
sha256sums_x86_64=('bccc4a9f7e9c3133c9e8fa7faedaa3afca4afa6dcf76674f0ca14ab0d4baa897')
sha256sums_aarch64=('516c498713f965277ce49a29b9eaea0010775b404bf5223e26359cd520c25d66')

case "${CARCH}" in
  x86_64) _bin="nimsync-${pkgver}-linux-x64" ;;
  aarch64) _bin="nimsync-${pkgver}-linux-arm64" ;;
esac

package() {
  install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/nimsync"
  install -Dm644 "${srcdir}/nimsync-LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
