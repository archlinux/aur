# Maintainer: Josef Miegl <josef@miegl.cz>
# Contributor: Gaetan Bisson <bisson@archlinux.org
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>
# Contributor: codyps <archlinux@codyps.com>

pkgname=aircrack-ng-git
pkgver=20190223.8d5bd358
pkgrel=1
pkgdesc="WiFi security auditing tools suite"
url="https://aircrack-ng.org"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('GPL2')
makedepends=('git' 'python')
depends=('gcc-libs' 'libnl' 'openssl' 'sqlite' 'hwloc' 'pcre' 'libpcap' 'iw' 'net-tools' 'ethtool')
optdepends=('python: dump-join, airgraph-ng, versuck-ng, airdrop-ng')
provides=("${pkgname%-git}" 'aircrack-ng-scripts')
conflicts=("${pkgname%-git}" 'aircrack-ng-scripts')
replaces=('aircrack-ng-svn' 'aircrack-ng-scripts')
source=("git+https://github.com/aircrack-ng/aircrack-ng.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
  cd "${pkgname%-git}"
  autoreconf -f -i
}

build() {
  cd "${pkgname%-git}"
  ./configure --with-experimental --with-ext-scripts --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var
  make
}

check() {
  cd "${pkgname%-git}"
  make check
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
