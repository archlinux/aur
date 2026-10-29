# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=okc
pkgver=0.7.2
pkgrel=1
pkgdesc="Command-line client for the Muse Spark Open Kernel Challenge"
arch=('x86_64' 'aarch64')
url="https://openkernelchallenge.dev"
# Upstream ships no licence file, so namcap reports one missing; do not invent one to silence it.
license=('LicenseRef-proprietary')
# Static Go binary: TLS roots come from the system trust store, which namcap cannot see.
depends=('ca-certificates')
optdepends=('git: "okc serve init" fetches the pinned SGLang with git')
# Already stripped upstream; !strip keeps the installed file byte-identical to upstream's SHA256SUMS.
options=('!strip' '!debug')
source_x86_64=("okc_${pkgver}_x86_64.gz::https://openkernelchallenge.dev/okc/${pkgver}/okc-linux-amd64.gz")
sha256sums_x86_64=('151719b64903bc996abc37b9f09a05c658f2e4665d0dc15a25ff6cc78f124a49')
source_aarch64=("okc_${pkgver}_aarch64.gz::https://openkernelchallenge.dev/okc/${pkgver}/okc-linux-arm64.gz")
sha256sums_aarch64=('cf51ce9defe357712ed050e4d35b883e3e2f3ec1ea6df5b4852d9b0493fd9653')

latestver() {
  curl -fsSL https://openkernelchallenge.dev/okc/latest
}

build() {
  chmod +x "okc_${pkgver}_${CARCH}"
}

check() {
  ./okc_${pkgver}_${CARCH} version | grep -qx "okc ${pkgver}"
}

package() {
  install -Dm755 "okc_${pkgver}_${CARCH}" "${pkgdir}/usr/bin/okc"
}
