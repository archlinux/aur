# Maintainer: Bruno Miguel <bruno@privacyrequired.com>

pkgname="relaxator-git"
_pkgname="relaxator"
pkgdesc="Relax to soothing sounds"

arch=(x86_64)
license=("GPL-3.0")

source=("git+https://github.com/alexkdeveloper/relaxator")
url="https://github.com/alexkdeveloper/relaxator"

pkgver=1.0.8.f2a7f3a
pkgrel=2

depends=("gtk4" "libadwaita" "vala")
makedepends=("meson" "ninja" "git")
provides=($_pkgname)

md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)//;s/-/./g'
}

build() {
  cd "$_pkgname"
  meson build --prefix=/usr
  cd build
  ninja
}

package() {
  cd "$_pkgname"
  install -Dm755 build/com.github.alexkdeveloper.relaxator "${pkgdir}/usr/bin/relaxator"
  install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/relaxator/LICENSE"
}
