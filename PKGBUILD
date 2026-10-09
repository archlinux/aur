# Maintainer: Andrey Kashlak <me@andreymal.org>

pkgname=aspia-host-bin
_pkgname=${pkgname%-bin}
pkgver=3.0.31
pkgrel=1
pkgdesc="Remote desktop control and file transfer tool (host, official binary)"
url="https://aspia.org/"
arch=(x86_64)
license=(GPL-3.0-only)
depends=(
  dbus
  glibc
  hicolor-icon-theme
  libgcc
  libstdc++
  pam
  polkit
  ttf-font
)
backup=(etc/pam.d/aspia-terminal)
provides=(aspia-host)
conflicts=(aspia-host)
options=(!debug !strip)
source=(aspia-terminal.pam)
source_x86_64=("https://github.com/dchapyshev/aspia/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch}.deb")
sha256sums=('8e0aced1c552483f1df1fe8dd7de1c18435c0c397741a9f6f60d36ec5aae1466')
sha256sums_x86_64=('0cd9745bc39005f64d9eb766f0098c5e45b76dd22d341c54491395f2328e5922')

package() {
  cd "${srcdir}"
  bsdtar -xzf data.tar.xz -C "${pkgdir}"

  mkdir -p "${pkgdir}/etc/pam.d"
  install -m 644 aspia-terminal.pam "${pkgdir}"/etc/pam.d/aspia-terminal
}
