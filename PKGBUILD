# Maintainer: Agustin Carrasco <asermax@gmail.com>

_pkgname=ghui
pkgname=ghui-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Terminal UI for GitHub pull requests"
arch=('x86_64' 'aarch64')
url="https://github.com/kitlangton/ghui"
license=('MIT')
depends=('glibc')
provides=('ghui')
conflicts=('ghui' 'ghui-git')
options=('!strip')
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-linux-x64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.gz")
sha256sums=('4994c24b5bbb85529407e8cd0211efcf819236899d2c911cbdb18c00f231273a')
sha256sums_x86_64=('b0851be63d16033bb69d6c0c0122abe71dcd8398b83f1019d170a7dc60a16279')
sha256sums_aarch64=('5edc5587ffaf3905de4745c663f62d21df021b5365657d18ebedce58881b54ef')

latestver() {
  curl -s "https://api.github.com/repos/kitlangton/ghui/releases/latest" | \
    grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/' || true
}

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
