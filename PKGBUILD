# Maintainer: Campbell Jones <arch at serebit dot com>

pkgname=budgie-control-center
pkgver=1.1.1
pkgrel=1
pkgdesc="Budgie's main interface to configure various aspects of the desktop"
url="https://github.com/BuddiesOfBudgie/budgie-control-center"
license=(GPL)
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
sha256sums=('0a0f27cee3e5a33f17e6b34ad698b4a54fe8ef7c1d215a0aa9a07431722ac963'
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
