# Maintainer: TurboPunk <turbopunk@telenet.be>
# Contributor: José San Juan <josesj@gmail.com>
pkgname=snapmaker-luban-bin
pkgver=4.7.3
pkgrel=1
pkgdesc="Snapmaker Luban is an easy-to-use 3-in-1 software tailor-made for Snapmaker machines."
url="https://github.com/Snapmaker/Luban"
license=('AGPL v3')
arch=('x86_64')
provides=('snapmaker-luban')
conflicts=('snapmaker-luban')
options=('!strip')
source=(
    "https://github.com/Snapmaker/Luban/releases/download/v${pkgver}/snapmaker-luban-${pkgver}-linux-amd64.deb"
    "https://snapshot.debian.org/archive/debian/20191014T030756Z/pool/main/g/gconf/libgconf-2-4_3.2.6-6_amd64.deb"
)
sha256sums=('4ac4af521328521de626072c4a2444f8a6e14a7c7aeda0674c5cd20762d681c9'
            '57a77787a3b29cef92470e2ffdf6582924bfdab2f38d089c490c5ac8511c60cd')
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
