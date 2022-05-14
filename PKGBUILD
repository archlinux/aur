# Maintainer: Campbell Jones <dev at serebit dot com>

pkgname=budgie-control-center
pkgver=1.0.2
pkgrel=2
pkgdesc="Budgie's main interface to configure various aspects of the desktop"
url="https://github.com/BuddiesOfBudgie/budgie-control-center"
license=(GPL2)
arch=(x86_64 aarch64 armv7h)
depends=(budgie-desktop gnome-online-accounts libgtop libpwquality smbclient libcheese libnma
         udisks2 libhandy gsound colord-gtk icu)
makedepends=(docbook-xsl modemmanager meson)
optdepends=('system-config-printer: Printer settings'
            'gnome-user-share: WebDAV file sharing'
            'gnome-remote-desktop: screen sharing'
            'rygel: media sharing'
            'openssh: remote login'
            'power-profiles-daemon: Power profiles support')
conflicts=(gnome-control-center)
source=("https://github.com/BuddiesOfBudgie/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('8de5b98ecee719d52f938eec858788b59402caf0f48b76002375c6555c6383d3'
            'SKIP')
validpgpkeys=('1E1FB0017C998A8AE2C498A6C2EAA8A26ADC59EE' # David Mohammed <fossfreedom at ubuntu dot com>
              '0E0D97562A4EC8BD8E329DCDAA7A2325E04B609B') # Joshua Strobl <me at joshuastrobl dot com>

build() {
    arch-meson $pkgname-$pkgver build -Ddocumentation=true
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
