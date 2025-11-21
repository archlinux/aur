# Maintainer: Marshal Horn <kamocat at gmail dot com>

pkgname=opentracedecode-git
_pkgname=OpenTraceDecode
pkgver=0.1.0
pkgrel=2
pkgdesc="protocol decoder library for signal analysis"
arch=('x86_64')
url="https://opentracelab.github.io/website/"
license=('GPL-3.0-only') 
makedepends=('git' 'meson' 'ninja' 'pkgconf') # Add any other build dependencies here
depends=('glib2' 'python') # Add any runtime dependencies here
provides=('opentracedecode')
source=("git+https://github.com/OpenTraceLab/OpenTraceDecode.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | cut -f 1 -d '-' | cut -c 2-
}

build() {
  cd "${_pkgname}"
  arch-meson build # Configure Meson build directory
  meson compile -C build # Compile the project
}

check() {
  cd "${_pkgname}"
  meson test -C build --print-errorlogs # Run tests (optional)
}

package() {
  cd "${_pkgname}"
  meson install -C build --destdir "$pkgdir" # Install files to pkgdir
}
