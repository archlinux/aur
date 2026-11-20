# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname='dolphin-anty-bin'
pkgver=2026.323.70886
pkgrel=1
pkgdesc='Antidetect browser for multi-accounting'
arch=('x86_64')
url='https://dolphin-anty.com/'
license=('custom:Proprietary')
options=(!strip)
provides=('dolphin-anty')
makedepends=('libarchive')

# Upstream ships AppImage, .deb and .rpm for Linux. The .rpm payload is a
# malformed cpio (bad magic, truncated headers) that bsdtar/rpm2cpio cannot
# unpack, so we use the official .deb — identical /opt/Dolphin Anty layout.
_file="${pkgname%-*}-${pkgver}.deb"

source=("${_file}::https://dolphin-anty-cdn.com/anty-app/dolphin-anty-linux-amd64-latest.deb")
sha256sums=('2831a85928af25c3505454c4e1535eac43099b2b91686beedab81ee07bc0ee4e')

pkgver() {
    bsdtar -xf "${srcdir}/control.tar.xz" -O ./control | sed -n 's/^Version: //p'
}

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}