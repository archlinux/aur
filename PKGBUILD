# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
pkgname='vtunerc-dkms'
pkgdesc="VTuner client kernel module for virtual DVB's"
pkgver=1.4
pkgrel=1
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://code.google.com/p/vtuner/"
license=('GPL2')
depends=('linux>=3.3' 'dkms')
conflicts=('vtuner-module' 'vtuner-module-lts')
source=("vtuner.linux-driver-rel${pkgver}.tar.gz::https://github.com/lecotex/vtuner.linux-driver/archive/rel${pkgver}.tar.gz"
        'kernel-3.10.patch'
        'kernel-4.2.patch'
        'kernel-4.6.patch'
        'tweaks.patch'
        '93-vtunerc.rules'
        'dkms.conf')
sha256sums=('c6ba0cfd808e3f8473a5ea25d4ac2871b826edc62de5f3624c0bd812aad63bc1'
            'caf2b8c5c4bf7808da4c48fa272f1706e0ca1ca4db84a08d9d2373e6e38e7812'
            'ab7f8c73aa578e4bc0a7cf58c112115cb6f215eb0a7f013773d6d4a50730d527'
            '6c634f32b245cfc097e45b426515a1d8f5c892a60a9f9e442540d6b3a2489042'
            'bd5d9b0659fb8a2d8555adc7f60bcf2915f29244402a744aac9e10b1a50adb8c'
            '4b2d860cac8c8bab2d8fa79760d4405bef6fd042f4e78b680d25d1a5ebcbf83d'
            'd2e90a5d2da394c9ffe4ab796383d6cdd7304e926ad095b7dad6fec4a23efd5d')

package() {
	install -dm755 ${pkgdir}/usr/src/vtunerc-${pkgver}/patches
	cp \
		${srcdir}/vtuner.linux-driver-rel${pkgver}/* \
		${srcdir}/dkms.conf \
		${pkgdir}/usr/src/vtunerc-${pkgver}
	cp ${srcdir}/*.patch ${pkgdir}/usr/src/vtunerc-${pkgver}/patches
	install -Dm644 ${srcdir}/93-vtunerc.rules ${pkgdir}/usr/lib/udev/rules.d/93-vtunerc.rules
}
