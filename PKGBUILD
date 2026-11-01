# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Marq Schneider <queueRAM@gmail.com>

pkgname=sim65
pkgver=2021.03
pkgrel=1
epoch=1
pkgdesc="65c02 simulation system"
arch=('i686' 'x86_64')
url="http://www.wsxyz.net/sim65/"
license=('GPL-3.0-or-later')
depends=('glibc' 'libstdc++' 'libgcc' 'wxwidgets-common' 'wxwidgets-gtk3')

source=(
  "http://www.wsxyz.net/${pkgname}/${pkgname}.tar.gz"
  'ull-typing.patch'
  'macro-typos.patch'
  'printf-overflows.patch'
)
sha256sums=('06dc7f414ac4817fe5248b405fa3af6587588db0ca821990268660b52751220b'
            '7a8451710982b0cc3cd80b2e828304a509ba91a326dd28a6c8c322836e982d5b'
            '3d602d76fe922c78a384fa36f12256095c3f90e6c5511f35f8de25c32fbeb701'
            '35c39fc9ef7d9af4cc90baa939a36e8159ca8053285be75dbc55f51a24e10652')

prepare() {
  cd "${srcdir}/${pkgname}"

  for p in \
    ull-typing.patch \
    macro-typos.patch \
    printf-overflows.patch
  do
    patch -p1 < "${srcdir}/$p"
  done
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  install -D -m755 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}-system"
}

# vim:set ts=2 sw=2 et:
