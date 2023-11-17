# Maintainer: Jat <chat@jat.email>

pkgname=libndi-bin
pkgver=5.5.3
pkgrel=3
pkgdesc='Custom build of ndi-sdk from obs-ndi'
arch=('x86_64')
license=('LGPL2.0')
url='https://github.com/obs-ndi/obs-ndi'
provides=('libndi')
conflicts=('libndi-git' 'ndi-sdk')
source=("a.deb::${url}/releases/download/4.11.1/libndi${pkgver%%.*}_${pkgver}-1_amd64.deb"
        "b.deb::${url}/releases/download/4.11.1/libndi${pkgver%%.*}-dev_${pkgver}-1_amd64.deb")
sha256sums=('3c47dd2386cd2a59df5f86953a7675ffe0ecf326eea784c4f17084f657a6e0ca'
            '9531dbacc56f89a727c4d1ae52dc9641ccd95e9067ac07e16376bf602c92c951')
noextract=('a.deb' 'b.deb')

prepare() {
    cd "${srcdir}" || exit
    mkdir a b

    bsdtar -xf a.deb -C a data.tar.zst
    bsdtar -xf b.deb -C b data.tar.zst
}

package() {
    cd "${srcdir}" || exit
    tar -xf a/data.tar.zst -C "${pkgdir}"
    tar -xf b/data.tar.zst -C "${pkgdir}"

    cd "${pkgdir}" || exit
    ln -frs "usr/lib/libndi.so.${pkgver}" "usr/lib/libndi.so.${pkgver%%.*}"
    ln -frs "usr/lib/libndi.so.${pkgver}" 'usr/lib/libndi.so'
}
