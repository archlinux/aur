# Maintainer: Izu <ccatdev at proton dot me>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Radek Podgorny <radek at podgorny dot cz>
# Contributor: Adam Caldwell <adam dot caldwell at gmail dot com>

pkgname=bwping
pkgver=2.6
pkgrel=1
pkgdesc="ICMP-based network bandwidth measurement tool"
arch=('x86_64')
url="https://bwping.sourceforge.io/"
license=('BSD-2-Clause')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/oleg-derevenetz/bwping/archive/RELEASE_${pkgver}.tar.gz")
sha256sums=('10355acc5726698cd4c6a24c04800e301f6d73e3740ff041e3468793fa52675f')

prepare() {
  cd "${pkgname}-RELEASE_${pkgver}"
  autoreconf -fi
}

build() {
  cd "${pkgname}-RELEASE_${pkgver}"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${pkgname}-RELEASE_${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/bwping/COPYING"
}
