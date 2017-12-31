# Maintainer: Niklas <dev@n1klas.net>

pkgname='libhomegear-base'
pkgdesc='Homegear base library'
pkgver=0.7.12
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL3')
url="https://homegear.eu"
depends=('gcc-libs')
source=("https://github.com/Homegear/libhomegear-base/archive/${pkgver}.tar.gz")
sha512sums=('6553a8d253780ed7811587b51889a63e3f4e63b10eba13a7361cd9437aaa446597c0cf86b191ed0b0a67a018cea153d512a5ff261167a60ffb74cfd7cd3ac5e5')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Use the our version number instead of the script which would have fetched it from Github
    sed -i -e "s#m4_esyscmd_s(\[./getVersion.sh\])#${pkgver}#" configure.ac
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./bootstrap
    ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --libdir=/usr/lib
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install
}
