# This is a software made by David Rosca (nowrep); published on GitHub.
#
# This PKGBUILD is modified by Martin von Reichenberg from original upstream dualsensectl-git PKGBUILD - https://github.com/nowrep/dualsensectl/blob/main/dist/PKGBUILD.
#
# RECOMMENDED:
# udev rules - https://github.com/nowrep/dualsensectl#udev-rules:
# Also installed by Steam, so you may already have it configured. If not, create an empty text file in /etc/udev/rules.d/70-dualsensectl.rules and add following lines:
#
# PS5 DualSense controller over USB hidraw
# KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ce6", MODE="0660", TAG+="uaccess"
#
# PS5 DualSense controller over bluetooth hidraw
# KERNEL=="hidraw*", KERNELS=="*054C:0CE6*", MODE="0660", TAG+="uaccess"

pkgname=dualsensectl
pkgver=0.2
pkgrel=1
pkgdesc='Tool for controlling PS5 DualSense controller on Linux'
arch=('any')
conflicts=('dualsensectl-git')
url='https://github.com/nowrep/dualsensectl'
license=('GPL2')
depends=('dbus' 'hidapi')
makedepends=('git' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nowrep/dualsensectl/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('SKIP')

build() {
    make -C "$pkgname-$pkgver"
}

package() {
    make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
    }

install() {
    $(CC) main.c -o $(TARGET) $(DEFINES) $(CFLAGS) $(LIBS)
    install -D -m 755 -p $(TARGET) $(DESTDIR)/usr/bin/$(TARGET)
	install -D -m 644 -p completion/$(TARGET) $(DESTDIR)/usr/share/bash-completion/completions/$(TARGET)
	install -D -m 644 -p completion/_$(TARGET) $(DESTDIR)/usr/share/zsh/site-functions/_$(TARGET)
}
