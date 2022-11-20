# This is a software made by David Rosca (nowrep); forked by Martin Stibor; published on GitHub.
#
# AUTHORS:
#
# Original developer:  David Rosca <nowrep@gmail.com>
# Arch Linux packager:  David Rosca <nowrep@gmail.com>
# Original openSUSE packager: Fabio Pesari  <fpesari@tuxfamily.org>
# openSUSE packager:  Martin Stibor <martin.von.reichenberg@protonmail.com>
# Fedora packager:  Christian Birk <mail@birkc.de>
# Debian/Ubuntu packager:  Martin Stibor <martin.von.reichenberg@protonmail.com>
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the GPL/MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.
#
# Please submit bugfixes or comments via https://bugzilla.opensuse.org/ | https://build.opensuse.org/ ; more info at https://en.opensuse.org/openSUSE:Submitting_bug_reports
# Alternatively use GitHub to contact the 'developers' directly.
#
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
pkgver=0.3
pkgrel=1
pkgdesc='Tool for controlling Sony PlayStation 5 DualSense controller on Linux'
arch=('any')
conflicts=('dualsensectl-git')
url='https://github.com/nowrep/dualsensectl'
license=('GPL2')
depends=('dbus' 'hidapi')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MartinVonReichenberg/dualsensectl/archive/refs/tags/v0.3.tar.gz")
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
    install -D -m 755 -p completion/$(TARGET) $(DESTDIR)/usr/share/bash-completion/completions/$(TARGET)
    install -D -m 755 -p completion/_$(TARGET) $(DESTDIR)/usr/share/zsh/site-functions/_$(TARGET)
}
