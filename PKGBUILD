# Copyright © 2026 Eser KUBALI <eserlxl@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later
#
# This file is part of linux-cleaner and is licensed under
# the GNU General Public License v3.0 or later.
# See the LICENSE file in the project root for details.

# Maintainer: Eser KUBALI <eserlxl@gmail.com>

pkgname=linux-cleaner
pkgver=1.7.1
pkgrel=1
pkgdesc='Safe, configuration-driven cleaner for caches and temporary files'
arch=('any')
url='https://github.com/eserlxl/cleaner'
license=('GPL-3.0-or-later')
depends=('bash>=4.4' 'coreutils' 'findutils' 'gawk' 'sed')
optdepends=('pacman-contrib: paccache-based package-cache actions' 'libnotify: desktop notifications for --notify' 'git: skip cleanup targets that hold git-tracked files')
backup=('etc/linux-cleaner/cleaner.conf')
install='linux-cleaner.install'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('e6ff2b31831be09531fc3632a4d29e33211398aeb0ac8e756008d01483f6ab068c35bd83a4eba1d86793f56191df952bca8e5cc05e772219f21aa3c89dbdda62')

build() {
    cd "$srcdir/cleaner-$pkgver"
    make
}

check() {
    cd "$srcdir/cleaner-$pkgver"
    make check-package
}

package() {
    cd "$srcdir/cleaner-$pkgver"
    # Install license file
    for name in LICENSE LICENSE.txt COPYING; do
        [[ -f "$name" ]] && install -Dm644 "$name" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" && break
    done
    # Install Make build artifacts
    make install DESTDIR="$pkgdir" PREFIX=/usr
}
