# Maintainer: Jasper Nuyens <jnuyens at linuxbe dot com>
# SPDX-License-Identifier: 0BSD
#
# This PKGBUILD (the packaging recipe) is licensed under 0BSD; see the
# LICENSE file alongside it. The modulejail package it builds is licensed
# under GPL-3.0-only by its upstream author (declared in license= below).
pkgname=modulejail
pkgver=1.3.0
pkgrel=1
pkgdesc='Proactively shrink Linux kernel-module attack surface by blacklisting unused modules'
arch=('any')
url='https://github.com/jnuyens/modulejail'
license=('GPL-3.0-only')
depends=('kmod')
optdepends=('util-linux: logger(1) for syslog integration')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('00bcf1ddd8e46f183782822b7a710209b405ab708afade61a028306340e2972e')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 modulejail "$pkgdir/usr/bin/modulejail"

    install -d "$pkgdir/usr/share/man/man8"
    BUILD_DATE=$(date -u ${SOURCE_DATE_EPOCH:+-d "@$SOURCE_DATE_EPOCH"} '+%Y-%m-%d')
    sed -e "s/__VERSION__/$pkgver/g" -e "s/__DATE__/$BUILD_DATE/g" man/modulejail.8.in \
        > "$pkgdir/usr/share/man/man8/modulejail.8"

    install -Dm644 README.md    "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
