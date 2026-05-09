# Maintainer: Agustin Carrasco <asermax@gmail.com>

_pkgname=hunk
pkgname=hunk-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Review-first terminal diff viewer for agentic coders"
arch=('x86_64' 'aarch64')
url="https://github.com/modem-dev/hunk"
license=('MIT')
depends=('glibc')
provides=('hunk')
conflicts=('hunk' 'hunk-git' 'hunkdiff')
options=('!strip')
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("hunkdiff-${pkgver}-linux-x64.tar.gz::${url}/releases/download/v${pkgver}/hunkdiff-linux-x64.tar.gz")
source_aarch64=("hunkdiff-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/hunkdiff-linux-arm64.tar.gz")
sha256sums=('e9a844c47847aacdcb894aed09ae6359f7b4fa85895a9b78edb5864b8bfef439')
sha256sums_x86_64=('eda5526139e08b40877bd9b48028e1b7c5edde8d030247665a4f21e821cdb7fe')
sha256sums_aarch64=('695f75d1bc7ef1b1aebe3c144301d25d20bd65c26a77a2d7d2f02fdfb4a94679')

latestver() {
  curl -s "https://api.github.com/repos/modem-dev/hunk/releases/latest" | \
    grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/' || true
}

package() {
  if [[ "${CARCH}" == "x86_64" ]]; then
    install -Dm755 "hunkdiff-linux-x64/hunk" "${pkgdir}/usr/bin/${_pkgname}"
  elif [[ "${CARCH}" == "aarch64" ]]; then
    install -Dm755 "hunkdiff-linux-arm64/hunk" "${pkgdir}/usr/bin/${_pkgname}"
  fi

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
