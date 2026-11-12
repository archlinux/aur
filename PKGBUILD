# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=porta-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Open-source SSH client with an encrypted local vault and zero-trust sync (terminal UI)"
arch=('x86_64')
url="https://gitlab.com/porta-ssh/porta"
license=('AGPL-3.0-only')
depends=('glibc')
optdepends=(
  'wl-clipboard: copy public keys to the clipboard on Wayland'
  'xclip: copy public keys to the clipboard on X11'
)
provides=('porta')
conflicts=('porta')
# Prebuilt binary: a -debug package would have no sources to go with it.
options=('!debug')
# Upstream's release links (/-/jobs/artifacts/<tag>/raw/...?job=build) redirect
# to the latest successful build job for the tag, so a retried pipeline would
# silently serve a rebuilt binary and break the checksum. Pin the job instead
# (artifacts are kept forever, expire_in: never). On update, read the new id from:
#   curl -sI "${url}/-/jobs/artifacts/v${pkgver}/raw/build/porta?job=build" | grep -i location
_job=17916099027
source=("${pkgname}-${pkgver}::${url}/-/jobs/${_job}/artifacts/raw/build/porta")
sha256sums=('e7287ce95bb002bbc5f172404d177e272e3d65a440e33e5ff338d34486051632')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/porta"
}
