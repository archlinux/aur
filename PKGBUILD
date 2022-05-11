# Maintainer: Campbell Jones <dev at serebit dot com>

pkgname=budgie-control-center
pkgver=1.0.1
pkgrel=4
pkgdesc="Budgie's main interface to configure various aspects of the desktop"
url="https://github.com/BuddiesOfBudgie/budgie-control-center"
license=(GPL2)
arch=(x86_64 aarch64 armv7h)
depends=(budgie-desktop gnome-online-accounts libgtop libpwquality smbclient libcheese libnma
         udisks2 libhandy gsound colord-gtk icu)
makedepends=(docbook-xsl modemmanager git python meson)
checkdepends=(python-dbusmock python-gobject xorg-server-xvfb)
optdepends=('system-config-printer: Printer settings'
            'gnome-user-share: WebDAV file sharing'
            'gnome-remote-desktop: screen sharing'
            'rygel: media sharing'
            'openssh: remote login'
            'power-profiles-daemon: Power profiles support')
conflicts=(gnome-control-center)
source=("https://github.com/BuddiesOfBudgie/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('6c049d02600f6650238b4376a7eac77d8fcd786e9c603c4e4ec87cad0022028a'
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
