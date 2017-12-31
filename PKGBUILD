# Maintainer: Niklas <dev@n1klas.net>

pkgname='libhomegear-node'
pkgdesc='Base library for Homegear nodes'
pkgver=0.7.12
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL3')
url="https://homegear.eu"
depends=('gcc-libs')
source=("https://github.com/Homegear/libhomegear-node/archive/${pkgver}.tar.gz")
sha512sums=('86d6a9231d8b7690ae3ec29a5e05e00ddbac886d317c2ac30d9a68af94ebe6f49ad079938275641c7dd3d824ad1a109c39e11685f54ea8a1f8c000fdfda35e57')

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
