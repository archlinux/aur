# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Based on:
# - https://aur.archlinux.org/packages/anytype-electron-bin
# - https://aur.archlinux.org/packages/element-desktop-nightly-bin

pkgname=anytype-alpha-bin
_truetag="beta" # Usually alpha, but sometimes they do the next version as beta which is weird
pkgver=0.41.39
pkgrel=1
pkgdesc="Local/offline first, decentralized, P2P & E2EE notes/mindmapping/'everything app' platform (alternative to Notion)."
arch=('x86_64')
url="https://anytype.io/"
license=('custom')
depends=(bash glibc gcc-libs libsecret glib2 hicolor-icon-theme)
optdepends=('org.freedesktop.secrets: for not having to sign in each time')
provides=('anytype')
conflicts=('anytype'
           'anytype-legacy'
           'anytype-electron-bin'
           'anytype-bin')
source=(
	"https://github.com/anyproto/anytype-ts/releases/download/v${pkgver}-${_truetag}/anytype_${pkgver}-${_truetag}_amd64.deb"
	"https://raw.githubusercontent.com/anyproto/anytype-ts/main/LICENSE.md"
)
sha256sums=('6a1ae78e8009170eb618f8902c8b68f41954c0e8bfb7f87ff67fc6a8be57848b'
            'daad9eb95adc6262b07115ba2cf87cd4c64acaca4b45d48e0fd3b15a72a31dc1')

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm644 "${srcdir}"/LICENSE.md -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
