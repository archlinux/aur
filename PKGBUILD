# Maintainer: madhat2r
#
# AUR-compliant pinned binary package for Gas City (`gc`).
# Reproducible: fixed pkgver + real checksums. Bump pkgver and refresh sums
# (run `updpkgsums`) on each upstream release.

_gitname=gascity
_binname=gc
pkgname=gascity-latest-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Gas City CLI (gc) — prebuilt release binary"
arch=('x86_64' 'aarch64')
url="https://github.com/gastownhall/gascity"
license=('MIT')
# Runtime tools gc shells out to. gc itself is a static binary (no lib deps).
# flock comes from util-linux (base), so it is not listed.
depends=(
    'tmux'
    'jq'
    'git'
    'dolt>=2.1.0'   # Beads data plane
    'bd'            # Beads CLI — virtual, any of beads/beads-bin/beads-git
)
optdepends=('github-cli: GitHub gate checks (gh)')
provides=('gascity' "${_binname}")
conflicts=('gascity')
options=('!strip')

_base="${url}/releases/download/v${pkgver}"
source_x86_64=("${_base}/gascity_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_base}/gascity_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('7abc26d826881d38219600e25e78a0a36802eddf9e6ed77046275f5ec9e72172')
sha256sums_aarch64=('305c55fe2832383264b4fb70a66af3d6af6255990c586760f8b21f01e6f043d4')

package() {
    cd "$srcdir"
    install -Dm755 "${_binname}" "$pkgdir/usr/bin/${_binname}"
}
