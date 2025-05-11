# Maintainer: Nucceteere <ruzgar at nucceteere dot xyz>
pkgname=serverseekerv2-git
_pkgname=serverseekerv2
pkgver=r122.089792e
pkgrel=1
pkgdesc="Fast Minecraft server scanner written in Rust"
arch=('x86_64')
url="https://git.funtimes909.xyz/ServerSeekerV2/ServerSeekerV2"
license=('GPL-3.0-or-later')
conflicts=('serverseekerv2')
provides=('serverseekerv2')
depends=('rust' 'cargo')
makedepends=('git')
source=("${_pkgname}::git+https://git.funtimes909.xyz/ServerSeekerV2/ServerSeekerV2.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 "target/release/ServerSeekerV2" "${pkgdir}/usr/bin/$_pkgname"
}
