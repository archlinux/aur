# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
# Contributor: Super Bo <supernbo@gmail.com>
pkgname=cloud-utils-git
_pkgbase=cloud-utils
pkgver=0.27.r269
pkgrel=1
pkgdesc="A useful set of utilities for interacting with a cloud"
provides="${_pkgbase}=$pkgver"
arch=(any)
url="https://launchpad.net/cloud-utils"
license=('GPL3')
groups=()
depends=(python2 python2-yaml python2-paramiko ca-certificates e2fsprogs file euca2ools util-linux wget gnupg cdrkit)
makedepends=()
optdepends=(gptfdisk)
backup=()
options=()
install=
source=("$pkgname::bzr+http://bazaar.launchpad.net/~${_pkgbase}-dev/$_pkgbase/trunk")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	major=$(bzr tags --sort=time | grep -v '?' | grep -E '^0.' | tail -n1 | awk '{print $1}')
	printf "$major.r%s" "$(bzr revno)"
}

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's@#!/usr/bin/python$@#!/usr/bin/python@' bin/*
}

build() {
	cd "$srcdir/$pkgname"
	make build
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="${pkgdir}" install
}

