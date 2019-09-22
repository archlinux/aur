# Maintainer: Rio Liu <rio6.liu@gmail.com>
pkgname=fluidsynth-dssi
pkgver=1.0.0
pkgrel=1
pkgdesc="A FluidSynth soundfont-playing plugin"
arch=('i686' 'x86_64')
url="http://dssi.sourceforge.net/download.html#FluidSynth-DSSI"
license=('LGPL')
depends=('liblo>=0.12' 'fluidsynth' 'ladspa' 'alsa-lib' 'gtk2')
makedepends=('dssi' 'pkgconfig' 'automake' 'autoconf')
options=('!libtool')
source=("https://phoenixnap.dl.sourceforge.net/project/dssi/fluidsynth-dssi/${pkgver}/fluidsynth-dssi-${pkgver}.tar.gz"
        "fluidsynth-dssi-libfluidsynth2.patch"
        fluidsynth-dssi)
md5sums=('6c9f660f0df4d2aad5076de75b2a0a67'
        'a75b8b0458825751d55a748e04108aee'
        'b4bb457b3124188069e49a23102edcbc')

prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}
    patch --forward --strip=1 --input="${srcdir}/fluidsynth-dssi-libfluidsynth2.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make || return 1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install || return 1
    install -D -m755 ${srcdir}/fluidsynth-dssi ${pkgdir}/usr/bin/fluidsynth-dssi
}
