# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=okc
pkgver=0.8.0
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
sha256sums_x86_64=('caba3f3baf982006c5a70719df3844db7dd9471b8a4ca5f0f446d39ce6599635')
sha256sums_aarch64=('b32b709ec0bee445ce457a2145cf3c472118c7e2f2efd0af8e5411c2298b6945')
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
