# Maintainer: Bruno Miguel <bruno@privacyrequired.com>

pkgname="relaxator-git"
_pkgname="relaxator"
pkgdesc="Relax to soothing sounds"

arch=(x86_64)
license=("GPL-3.0")

source=("git+https://github.com/alexkdeveloper/relaxator")
url="https://github.com/alexkdeveloper/relaxator"

pkgver=1.0.7.r4.g928d2dc
pkgrel=1

depends=("gtk4" "libadwaita")
makedepends=("meson" "ninja" "git")
provides=($_pkgname)

md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  meson build --prefix=/usr
  cd build
  ninja
}

package() {
  cd "$_pkgname"/build
  install -Dm755 com.github.alexkdeveloper.relaxator "${pkgdir}/usr/bin/relaxator"
}
