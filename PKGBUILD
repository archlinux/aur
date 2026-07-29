# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=heimdall-rs-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="Advanced EVM toolkit for bytecode analysis and decompiling unverified contracts"
arch=('x86_64' 'aarch64')
url="https://heimdall.rs"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')

# Upstream's binary is named `heimdall`, which collides with extra/heimdall (the
# Samsung Galaxy flashing tool), so it is installed as `heimdall-rs`. clap derives
# its usage text from argv[0], so the renamed binary stays self-consistent.
_repo="Jon-Becker/heimdall-rs"

source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/${_repo}/${pkgver}/LICENSE")
sha256sums=('a0b5efeafe7a3fb21daa0124b7c080f3950a6277bfded6e1da06c4f3bd8ed5a4')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/${_repo}/releases/download/${pkgver}/heimdall-linux-amd64")
sha256sums_x86_64=('8d58c97f56d584d5d0737d0d0895fc8c68b7b8b2b680f2a7842245789f0b4868')

source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/${_repo}/releases/download/${pkgver}/heimdall-linux-arm64")
sha256sums_aarch64=('ef1d236e5e194e1722e12552b66303d3172e0c4cc267b096f7bc8a053f168df8')

latestver() {
    gh api "repos/${_repo}/releases/latest" --jq '.tag_name' | sed -E 's/^v//'
}

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
