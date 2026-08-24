# Maintainer: Bebbssos
# Template — placeholders (0.3.1 / @SHA256_*@) are filled in by
# pkg/aur/render.sh at release time. Do not edit the rendered output by hand;
# edit this file and let the release workflow re-render it.
pkgname=ixr-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Unofficial Rust port of the Internxt CLI (faster, single static binary, streaming transfers)"
arch=('x86_64' 'aarch64')
url="https://github.com/Bebbssos/internxt-cli-rust"
license=('MIT')
provides=('ixr')
conflicts=('ixr')
optdepends=('fuse3: needed by `mount`/`serve fuse` — provides the fusermount3 helper the binary shells out to')

# Local filename is versioned via `name::url` — the release asset itself
# keeps a static name across versions, and makepkg/yay key their source
# cache off the local filename, not the URL. Without the version in it, a
# stale cached tarball from a prior pkgver survives a version bump and fails
# the (correct, updated) sha256 check.
source_x86_64=("ixr-x86_64-unknown-linux-gnu-${pkgver}.tar.gz::https://github.com/Bebbssos/internxt-cli-rust/releases/download/v${pkgver}/ixr-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("ixr-aarch64-unknown-linux-gnu-${pkgver}.tar.gz::https://github.com/Bebbssos/internxt-cli-rust/releases/download/v${pkgver}/ixr-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9fc41732a51357cbc52cc80c0feefa39c9cdeb4b555a1ae431db87977531f150')
sha256sums_aarch64=('f7caded736792cec224b8a7834b3c56ca1715bd5fa017a560442bfbc5cc08c12')

package() {
  install -Dm755 "${srcdir}/ixr" "${pkgdir}/usr/bin/ixr"
}
