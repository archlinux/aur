# Maintainer: Jasper Nuyens <jnuyens at linuxbe dot com>
# SPDX-License-Identifier: 0BSD
#
# This PKGBUILD (the packaging recipe) is licensed under 0BSD; see the
# LICENSE file alongside it. The modulejail package it builds is licensed
# under GPL-3.0-only by its upstream author (declared in license= below).
pkgname=modulejail
pkgver=1.2.4
pkgrel=1
pkgdesc='Proactively shrink Linux kernel-module attack surface by blacklisting unused modules'
arch=('any')
url='https://github.com/jnuyens/modulejail'
license=('GPL-3.0-only')
depends=('kmod')
optdepends=('util-linux: logger(1) for syslog integration')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ceee816e24b7dcf971f7ed49f8415a0cb77c06ecd0b4ac9c2cabf91463d32597')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 modulejail "$pkgdir/usr/bin/modulejail"

    install -d "$pkgdir/usr/share/man/man8"
    sed "s/__VERSION__/$pkgver/g" man/modulejail.8.in \
        > "$pkgdir/usr/share/man/man8/modulejail.8"

    install -Dm644 README.md    "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
