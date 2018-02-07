# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname='vtunerc-dkms'
pkgdesc="VTuner client kernel module for virtual DVB's"
pkgver=1.4
pkgrel=3
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://code.google.com/p/vtuner"
license=('GPL2')
depends=('linux>=3.3' 'dkms')
conflicts=('vtuner-module' 'vtuner-module-lts')
source=("vtuner.linux-driver-rel${pkgver}.tar.gz::https://github.com/lecotex/vtuner.linux-driver/archive/rel${pkgver}.tar.gz"
        'kernel-3.10.patch'
        'kernel-4.2.patch'
        'kernel-4.6.patch'
        'kernel-4.15.patch'
        'tweaks.patch'
        '93-vtunerc.rules'
        'dkms.conf')
sha256sums=('c6ba0cfd808e3f8473a5ea25d4ac2871b826edc62de5f3624c0bd812aad63bc1'
            '5793c331fd8290a81ac15f7815447fcb880a0b38b562aac24ad171448787057a'
            '5be590ec7c98ef199bd7643712685ffa7474010cc6fc95fd8ca347e92e46d45f'
            'fcbaa696db85c888808919b81907a84fc1607fc5b5663c009927d5af322a1085'
            '52c6700a8ccad5e6ee2b25f165dcd167d852ec9448700e00bc62c07303a86ebd'
            'bbcebd1e8252d6961733b333731c1d2777d41de7edc0c04ffb2d7b381c046368'
            '4b2d860cac8c8bab2d8fa79760d4405bef6fd042f4e78b680d25d1a5ebcbf83d'
            '2c0087962b08d2f3865c00f5bff1837409d021072a7f81ff77fb7419e6c2c0d8')

package() {
	install -dm755 ${pkgdir}/usr/src/vtunerc-${pkgver}/patches
	cp \
		${srcdir}/vtuner.linux-driver-rel${pkgver}/* \
		${srcdir}/dkms.conf \
		${pkgdir}/usr/src/vtunerc-${pkgver}
	cp ${srcdir}/*.patch ${pkgdir}/usr/src/vtunerc-${pkgver}/patches
	install -Dm644 ${srcdir}/93-vtunerc.rules ${pkgdir}/usr/lib/udev/rules.d/93-vtunerc.rules
}
