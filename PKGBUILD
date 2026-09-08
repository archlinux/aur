# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=rasdaemon
pkgname="${_pkgname}"-git
pkgver=0.9.92.r14.g78f462c
pkgrel=1
pkgdesc="A RAS (Reliability, Availability and Serviceability) logging tool using the EDAC tracing events"
arch=('x86_64' 'i686' 'aarch64')
url=https://github.com/mchehab/rasdaemon
license=('GPL-2.0-only')
depends=('pciutils' 'perl-dbd-sqlite' 'hwdata' 'dmidecode' 'libtraceevent')
makedepends=('git' 'meson')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/sysconfig/rasdaemon')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's|^v||;s|-|.r|;s|-|.|'
}

build() {
  arch-meson ${_pkgname} build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "${pkgdir}"
}
