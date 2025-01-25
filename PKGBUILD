# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=libstirshaken
pkgver=1.0.0
pkgrel=1
pkgdesc="STIR-Shaken authentication and verification library"
arch=('x86_64')
url="https://github.com/signalwire/libstirshaken"
license=('MIT')
depends=(
  'curl'
  'glibc'
  'libjwt'
  'libks'
  'openssl'
)
makedepends=(
  'autoconf'
  'automake'
  'cmake'
  'gcc'
  'gdb'
  'git'
  'libtool'
  'make'
  'pkg-config'
)
source=("git+${url}.git#commit=cb6ede40b3ce12ab76e370186a14dc141839ef07")
sha256sums=('3b4eece0fbfa91c050b825d17053935013e7e72f83503829dd05d7a507793346')

build() {
  cd "${srcdir}/${pkgname}"

  ./bootstrap.sh
  ./configure --prefix=/usr
  # -fcf-protection=full: Enables control-flow protection
  # -Wno-deprecated-declarations: Suppresses warnings about deprecated declarations
  make CFLAGS+=" -fcf-protection=full -Wno-deprecated-declarations"
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install
  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
