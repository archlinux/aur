# Copyright © 2026 Eser KUBALI <eserlxl@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later
#
# This file is part of linux-cleaner and is licensed under
# the GNU General Public License v3.0 or later.
# See the LICENSE file in the project root for details.

# Maintainer: Eser KUBALI <eserlxl@gmail.com>

pkgname=linux-cleaner
pkgver=1.9.0
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
b2sums=('1b45889b7ae25017536937c356dde4186a3767c115f7259291deee74ab6689cc5a5b878f599b5ce54c8a4e9c324c848f2fb0b581a8c5ac60a893e19f1d7a66ce')

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
    for name in LICENSE LICENSE.txt LICENSE.md LICENCE COPYING COPYING.md; do
        [[ -f "$name" ]] && install -Dm644 "$name" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" && break
    done
    # Install Make build artifacts
    make install DESTDIR="$pkgdir" PREFIX=/usr
}
