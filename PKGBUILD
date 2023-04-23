# Maintainer: Jat <chat@jat.email>

pkgname=libndi-bin
pkgver=5.5.3
pkgrel=1
pkgdesc="Custom build of ndi-sdk from obs-ndi"
arch=('x86_64')
license=('LGPL2.0')
url="https://github.com/Palakis/obs-ndi"
provides=('libndi')
conflicts=('libndi-git' 'ndi-sdk')
source=("a.deb::${url}/releases/latest/download/libndi${pkgver%%.*}_${pkgver}-${pkgrel}_amd64.deb"
        "b.deb::${url}/releases/latest/download/libndi${pkgver%%.*}-dev_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('3c47dd2386cd2a59df5f86953a7675ffe0ecf326eea784c4f17084f657a6e0ca'
            '9531dbacc56f89a727c4d1ae52dc9641ccd95e9067ac07e16376bf602c92c951')
noextract=('a.deb' 'b.deb')

prepare() {
    cd "${srcdir}"
    mkdir a b

    bsdtar -xf a.deb -C a data.tar.zst
    bsdtar -xf b.deb -C b data.tar.zst
}

package() {
    cd "${srcdir}"

    tar -xf a/data.tar.zst -C "${pkgdir}"
    tar -xf b/data.tar.zst -C "${pkgdir}"
}
