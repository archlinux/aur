# Maintainer: naniwakun <radio.naniwa[atmark]gmail.com>

pkgname=jdim-git
pkgver=r4351.31732152
pkgrel=1
pkgdesc="A 2channel browser written in C++ using gtkmm3. This is public beta version."
arch=('i686' 'x86_64')
url="https://github.com/JDimproved/JDim"
license=('GPL2')
makedepends=('git' 'meson')
depends=('gnutls' 'libsm' 'gtkmm3')
conflicts=('jd' 'jd-svn' 'jd-gtk3' )
source=("git+${url}.git")
sha256sums=('SKIP')
pkgver() {
  cd "${srcdir}/JDim"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/JDim"
  meson setup -Dunity=on builddir --prefix=/usr
  ninja -C builddir
}

package() {
  cd "${srcdir}/JDim"
  meson install -C builddir --destdir $pkgdir
} 
