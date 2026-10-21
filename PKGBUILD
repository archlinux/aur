# Copyright © 2026 Eser KUBALI <eserlxl@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later
#
# This file is part of linux-tmpcleaner and is licensed under
# the GNU General Public License v3.0 or later.
# See the LICENSE file in the project root for details.

# Maintainer: Eser KUBALI <eserlxl@gmail.com>

pkgname=linux-tmpcleaner
pkgver=1.2.2
pkgrel=1
pkgdesc='Systemd timer that deletes old /tmp entries while protecting files in use'
arch=('any')
url='https://github.com/eserlxl/tmpCleaner'
license=('GPL-3.0-or-later')
depends=('systemd>=249' 'bash' 'coreutils' 'findutils' 'gawk' 'grep' 'sed')
conflicts=('tmpcleaner')
backup=('etc/tmpcleaner/tmpcleaner.conf')
install='linux-tmpcleaner.install'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('0ab5e2f7fa90f92e8cb44c2a859e18836e5619297808d7a82459222a608ba6349a35e1b5594188906296023f839265af7fa7045f5d826494c0700608da24216b')

build() {
    cd "$srcdir/tmpCleaner-$pkgver"
    # No build steps required
    :
}

check() {
    cd "$srcdir/tmpCleaner-$pkgver"
    make check-package
}

package() {
    cd "$srcdir/tmpCleaner-$pkgver"
    # Install license file
    for name in LICENSE LICENSE.txt COPYING; do
        [[ -f "$name" ]] && install -Dm644 "$name" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" && break
    done
    # Install Make build artifacts
    make install DESTDIR="$pkgdir" PREFIX=/usr UNITDIR=/usr/lib/systemd/system
}
