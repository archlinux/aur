# Maintainer: Michael Picht <mipi@fsfe.org>
# SPDX-FileCopyrightText: 2020 Michael Picht <mipi@fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

_pkgorg=gitlab.com/mipimipi
pkgname=armutils-git
_pkgname=armutils
pkgver=0.2.0
pkgrel=1
pkgdesc="Build ARM packages in chroot containers on x86_64"
arch=(x86_64)
url="https://$_pkgorg/$_pkgname"
license=(GPL3)
source=("git+https://$_pkgorg/$_pkgname.git")
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
md5sums=(SKIP)
depends=(
    binfmt-qemu-static
    libarchive
    qemu-user-static
)
optdepends=(
    "wget: needed to download image files"
    "qemu-headless: either this or qemu is required"
)
makedepends=(
    git
    make
)
provides=(armutils)

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
}
