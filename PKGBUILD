# Maintainer: Atom Long <atom.long@hotmail.com>

pkgname=libcron-git
pkgver=1.3.0.r4.ge91a51a
pkgrel=1
pkgdesc='A C++ scheduling library using cron formatting.'
url='https://github.com/PerMalmberg/libcron'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')
makedepends=('cmake' 'git')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname%-git}
  git submodule update --init
}

build() {
  cd ${pkgname%-git}
  cmake -DCMAKE_BUILD_TYPE=Release .
  make libcron
}

package() {
  cd ${pkgname%-git}
  install -Dm644 libcron/out/Release/liblibcron.a -t ${pkgdir}/usr/lib/
  install -Dm644 libcron/include/libcron/* -t ${pkgdir}/usr/include/libcron/
  install -Dm644 libcron/externals/date/include/date/* -t ${pkgdir}/usr/include/date/
}
