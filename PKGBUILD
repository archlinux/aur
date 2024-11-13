# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Based on:
# - https://aur.archlinux.org/packages/anytype-electron-bin
# - https://aur.archlinux.org/packages/element-desktop-nightly-bin

pkgname=anytype-alpha-bin
_truetag="-alpha" # Usually -alpha, but sometimes they do the next version as -beta or blank (stable) which is weird
pkgver=0.43.15
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
	"https://github.com/anyproto/anytype-ts/releases/download/v${pkgver}${_truetag}/anytype_${pkgver}${_truetag}_amd64.deb"
	"https://raw.githubusercontent.com/anyproto/anytype-ts/main/LICENSE.md"
)
sha256sums=('d4a9ae6d66800631c29676439c4c297700fe7e910d02262a5ad9e6ac1a03016a'
            'daad9eb95adc6262b07115ba2cf87cd4c64acaca4b45d48e0fd3b15a72a31dc1')

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm644 "${srcdir}"/LICENSE.md -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
