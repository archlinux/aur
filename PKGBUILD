# Maintainer: José San Juan <josesj@gmail.com>
pkgname=snapmaker-luban
pkgver=3.4.2
pkgrel=1
pkgdesc="Snapmaker Luban is an easy-to-use 3-in-1 software tailor-made for Snapmaker machines."
url="http://www.snapmaker.com"
license=('AGPL v3')
arch=('x86_64')
md5sums=('ab939afafe59b93e85c508f174752975'
         '4030a38f07ebc0a322355a160e669e65'
)

source=(
    "https://github.com/Snapmaker/Luban/releases/download/v${pkgver}/snapmaker-luban-${pkgver}-linux-amd64.deb"
    "https://snapshot.debian.org/archive/debian/20191014T030756Z/pool/main/g/gconf/libgconf-2-4_3.2.6-6_amd64.deb"
)

noextract=("${source[@]##*/}")

prepare() {

    ar -x "${srcdir}/snapmaker-luban-${pkgver}-linux-amd64.deb" data.tar.xz
    mkdir "${srcdir}/luban"
    tar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/luban/"
    rm "${srcdir}/data.tar.xz"

    ar -x "${srcdir}/libgconf-2-4_3.2.6-6_amd64.deb" data.tar.xz
    mkdir "${srcdir}/libgconf"
    tar -xf "${srcdir}/data.tar.xz" -C "${srcdir}/libgconf/"
    rm "${srcdir}/data.tar.xz"

}

package() {
  mv "${srcdir}/luban/opt" "${pkgdir}/"
  mv "${srcdir}/luban/usr" "${pkgdir}/"
  mv "${srcdir}/libgconf/usr/lib/${CARCH}-linux-gnu/libgconf-2.so.4.1.5" "${pkgdir}/opt/Snapmaker Luban/libgconf-2.so.4"
}
