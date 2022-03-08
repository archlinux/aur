# Maintainer: Ong Yong Xin <ongyongxin2020+github AT gmail DOT com>
# Contributor: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Rayfalling <Rayfalling@outlook.com>
# Contributor: facekapow, rayfalling, Ducksoft
pkgname=genie-systemd-git
pkgver=2.2.r11.g577a561
pkgrel=1
pkgdesc="A quick way into a systemd \"bottle\" for WSL"
arch=('x86_64')
url="https://github.com/arkane-systems/genie"
license=('Unlicense')
depends=('daemonize' 'python' 'python-psutil' 'systemd')
makedepends=('git' 'python-pip')
provides=('genie-systemd')
conflicts=('genie-systemd')
options=(!strip)
source=("git+https://github.com/arkane-systems/genie.git")
sha256sums=('SKIP')
backup=('etc/genie.ini')

pkgver() {
  cd genie
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd genie
  make build-binaries
}

package() {
  cd genie
	make DESTDIR=${pkgdir} internal-package
	make DESTDIR=${pkgdir} internal-supplement
}

# vim:set ts=2 sw=2 et:
