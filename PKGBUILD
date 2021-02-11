# Maintainer: Josef Miegl <josef@miegl.cz>
# Contributor: Gaetan Bisson <bisson@archlinux.org
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>
# Contributor: codyps <archlinux@codyps.com>
# Contributor: drygdryg <drygdryg2014 [at] yandex [dot] com>

pkgname=aircrack-ng-clang-git
pkgver=20210204.17f971ce
pkgrel=1
pkgdesc="Wi-Fi security auditing tools suite (built with Clang for brute force speedup)"
url="https://aircrack-ng.org"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'pentium4')
license=('GPL2')
makedepends=('git' 'python' 'clang')
depends=('gcc-libs' 'libnl' 'openssl' 'sqlite' 'hwloc' 'pcre' 'libpcap' 'iw' 'net-tools' 'ethtool')
optdepends=('python: dump-join, airgraph-ng, versuck-ng, airdrop-ng')
provides=('aircrack-ng' 'aircrack-ng-scripts')
conflicts=('aircrack-ng-git' 'aircrack-ng' 'aircrack-ng-scripts')
replaces=('aircrack-ng-svn' 'aircrack-ng-scripts')
source=("git+https://github.com/aircrack-ng/aircrack-ng.git")
sha256sums=('SKIP')

pkgver() {
  cd "aircrack-ng"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
  cd "aircrack-ng"
  autoreconf -f -i
}

build() {
  cd "aircrack-ng"
  ./configure CC=clang CXX=clang++ --with-experimental --with-ext-scripts --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var
  make
}

check() {
  cd "aircrack-ng"
  make check
}

package() {
  cd "aircrack-ng"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
