# SPDX-License-Identifier: Apache-2.0
# Copyright 2018-2025 Gliim LLC. 
# Licensed under Apache License v2. See LICENSE file.
# On the web http://golf-lang.com/ - this file is part of Golf framework.

# Build locally: makepkg --noconfirm -s
# Check this file: namcap PKGBUILD
# Run installer: sudo pacman -U --noconfirm <pkg.tar.gz file>

# Maintainer: Golf Team <team@golf-lang.com>
pkgname=golf
pkgver=601.4.58
pkgrel=0
epoch=
pkgdesc="Programming language and application server for building and running web services and web applications. High performance and memory-safe."
arch=("x86_64")
url="https://golf-lang.com"
license=('Apache-2.0')
groups=()
#NOTE: when depends change, makepkg --printsrcinfo >.SRCINFO must run to refresh .SRCINFO !!
depends=(make gcc openssl curl 'mariadb-libs' fcgi 'postgresql-libs' sqlite3 pcre2 libxml2 man-db)
makedepends=()
checkdepends=()
optdepends=()
provides=(golf)
conflicts=()
replaces=()
backup=()
options=()
install=arch.install
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/golf-lang/golf/archive/refs/tags/${pkgver}.tar.gz")
        
noextract=()
md5sums=(SKIP)
validpgpkeys=()

prepare() {
	tar xvfz ${pkgname}-${pkgver}.tar.gz 
}

build() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" clean
	make GG_ARCH_BUILD=1 DESTDIR="$pkgdir/"
}

check() {
	cd "${pkgname}-${pkgver}"
}

package() {
	cd "${pkgname}-${pkgver}"
	make GG_ARCH_BUILD=1 DESTDIR="$pkgdir/" install
}

post_install() {
   echo "Setting up man pages..."
   mandb >/dev/null 2>&1 || true
}
