# Maintainer: Josef Miegl <josef@miegl.cz>
# Contributor: Gaetan Bisson <bisson@archlinux.org
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>
# Contributor: codyps <archlinux@codyps.com>

pkgname=aircrack-ng-git
pkgver=20190122.c4c67825
pkgrel=1
pkgdesc="WiFi security auditing tools suite"
url="https://aircrack-ng.org"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL2')
makedepends=('git' 'python')
depends=('gcc-libs' 'libnl' 'openssl' 'sqlite' 'iw' 'ethtool' 'net-tools')
optdepends=('python: dump-join, airgraph-ng, versuck-ng, airdrop-ng')
provides=("${pkgname%-git}" 'aircrack-ng-scripts')
conflicts=("${pkgname%-git}" 'aircrack-ng-scripts')
replaces=('aircrack-ng-svn' 'aircrack-ng-scripts')
source=("git://github.com/aircrack-ng/aircrack-ng.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  autoreconf -i
  ./configure --with-experimental --with-ext-scripts --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
