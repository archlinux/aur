# Maintainer: João Vitor S. Anjos <jvanjos at protonmail dot com>
# Contributor: Mario Moura <mario.henrique@protonmail.com>

pkgname=packit
pkgver=1.8.1
pkgrel=1
pkgdesc="network packet generator and capture tool"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/resurrecting-open-source-projects/packit"
license=('GPL2')
depends=('glibc' 'libnet' 'libpcap')
makedepends=('autoconf' 'automake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6e2237f33aaf37e43188e6b0a8092a6ff7b8736df3b34ce0e9e830294fc48281')

prepare() {
  patch -d ${pkgname}-${pkgver} -p1 < ../install_to_usr_bin.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm644 README.md ChangeLog -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
