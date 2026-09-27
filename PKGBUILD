# Maintainer: Christof Müller <hello@deviceshelf.app>
pkgname=deviceshelf-bin
pkgver=1.9.64
pkgrel=1
pkgdesc="Local-first network scanner: discover and identify every device on your LAN, with open ports and a security report"
arch=('x86_64')
url="https://deviceshelf.app"
# Proprietary, paid software with a 7-day trial. The terms live on the website;
# the package ships no licence file of its own, so LicenseRef- it is.
license=('LicenseRef-DeviceShelf')
# Matches the Depends line of the upstream .deb: gtk3, webkit2gtk-4.1, libpcap.
# libpcap is not optional — the binary links wpcap/libpcap at load time.
depends=('gtk3' 'webkit2gtk-4.1' 'libpcap')
provides=('deviceshelf')
conflicts=('deviceshelf')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::https://downloads.deviceshelf.app/DeviceShelf-${pkgver}.deb")
sha256sums=('1872097f7a207efbd0ba15f0c09665355ae95e2d56206299e1da19ca5a7b594a')

package() {
  # The .deb already follows the FHS: /usr/bin/deviceshelf, a .desktop entry and
  # a 512px hicolor icon. Unpacking data.tar.gz straight into $pkgdir is enough.
  bsdtar -xf data.tar.gz -C "$pkgdir"

  # Upstream puts its README under /usr/share/doc/deviceshelf; keep it, and add
  # a licence pointer where pacman users look for one.
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/share/doc/deviceshelf/README "$pkgdir/usr/share/licenses/$pkgname/README"
}
