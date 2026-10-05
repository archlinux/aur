# Maintainer: Keon Cachia <keonfarrugia@gmail.com>

pkgname=benben-appimage
pkgver=0.7.1
_pkgname=benben
_appimage="${_pkgname}"-"${pkgver}"-x86_64.AppImage
pkgrel=1
pkgdesc="An oldschool fast and efficient CLI audio player"
arch=("x86_64")
url="https://chiselapp.com/user/MistressRemilia/repository/benben/home"
license=('AGPL-3.0-or-later')
depends=("fuse2")
optdepends=("remote-benben: Used to control from Unix socket")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=("!strip")
source=(
    https://chiselapp.com/user/MistressRemilia/repository/benben/uv/"${_appimage}"
)
sha256sums=('37f6545c35f35d952c313e9f9398b01c7bc67957457b1f35a29056291ead8165')

prepare() {
  chmod +x "${_appimage}"
  "./${_appimage}" --appimage-extract
}

package() {
  install -Dm755 "${_appimage}" "${pkgdir}/usr/bin/benben"
  install -Dm644 -t "${pkgdir}/usr/share/applications" "squashfs-root/${_pkgname}.desktop"
}
