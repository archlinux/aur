# Maintainer: Atom Long <atom.long@hotmail.com>

pkgname=libcron
pkgver=1.3.0
pkgrel=1
pkgdesc='A C++ scheduling library using cron formatting.'
url='https://github.com/PerMalmberg/libcron'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
conflicts=("${pkgname}-git")
_date_ver=3.0.1
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "date-${_date_ver}.tar.gz::https://github.com/HowardHinnant/date/archive/refs/tags/v${_date_ver}.tar.gz")
sha256sums=('b99337dac5cacca90130849129529a719b32a8a38262d5bb0a4cac352e27041f'
            '7a390f200f0ccd207e8cff6757e04817c1a0aec3e327b006b7eb451c57ee3538')
makedepends=('cmake')

prepare() {
  cd ${pkgname}-${pkgver}
  cp -rf "${srcdir}/date-${_date_ver}" -T libcron/externals/date
}

build() {
  cd ${pkgname}-${pkgver}
  cmake -DCMAKE_BUILD_TYPE=Release .
  make libcron
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 libcron/out/Release/liblibcron.a -t ${pkgdir}/usr/lib/
  install -Dm644 libcron/include/libcron/* -t ${pkgdir}/usr/include/libcron/
  install -Dm644 libcron/externals/date/include/date/* -t ${pkgdir}/usr/include/date/
}
