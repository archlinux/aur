# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=okc
pkgver=0.8.4
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
sha256sums_x86_64=('c042e5306912892e5abe2da249012ad7cb7df3ba178737a8546e201c48d37e85')
sha256sums_aarch64=('aaabcf53fb08cc108fc2294854a8b2b21d6e2217e11ed20c803b71e813281153')
source_aarch64=("okc_${pkgver}_aarch64.gz::https://openkernelchallenge.dev/okc/${pkgver}/okc-linux-arm64.gz")

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
