# Maintainer: parov0z <andrey.android7890@gmail.com>

pkgname=bootsplash-manager-git
_pkgname=${pkgname//-git}
pkgver=1.9.r0.g4f83103
pkgrel=1
pkgdesc="Simple bootsplash manager"
url="https://github.com/parov0z/bootsplash-manager"
arch=(x86_64)
license=(GPL3)
depends=('qt5-base'
         'bootsplash-systemd'
         'kauth'
         'pamac'
         'sdl2')
conflicts=('bootsplash-manager-bin')

source=("git+https://github.com/parov0z/bootsplash-manager.git")
md5sums=('SKIP')

pkgver() {
     cd "$_pkgname"
     git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
     cd "${srcdir}"
     export CFLAGS+=" ${CPPFLAGS}"
     export CXXFLAGS+=" ${CPPFLAGS}"
     cmake -B build -S "${_pkgname}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -Wno-dev
     make -C build
}

package() {    
     make DESTDIR="${pkgdir}" PREFIX="/usr" -C build install
}
