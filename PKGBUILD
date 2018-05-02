# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname='vtunerc-dkms'
pkgdesc="VTuner client kernel module for virtual DVB's"
pkgver=1.4
pkgrel=5
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
        'kernel-4.16.patch'
        'tweaks.patch'
        '93-vtunerc.rules'
        'dkms.conf')
sha256sums=('c6ba0cfd808e3f8473a5ea25d4ac2871b826edc62de5f3624c0bd812aad63bc1'
            'f32fc67d748606633a20ee4b1b04c0282a37ed77e9692ea6e19bf2203fcc4bf3'
            '29f15d241848b355f4aefc803f34b6da60536da511b5a36535b946c3b7b1c232'
            '8bb5c7b9399f41ab52e0149c23fd8d6604a3998cf68d013967febae90912972c'
            '5bc7c82417b23d5cc321e4c99a30c18e75b291fa5dde25ba788554da791734f5'
            '78e2bec37fa91f7abd999b9d0871bc0c82d39da5e538f0a1b92db547313f5f1e'
            '9d7177aae059e343d772419ed904b287e018077221ade5d16f5b1d825005008a'
            '4b2d860cac8c8bab2d8fa79760d4405bef6fd042f4e78b680d25d1a5ebcbf83d'
            '47dfa9682b77b136bc72ecf45548ac93bf4dc50e2eaa94441d1401c1bef759a4')

package() {
	install -dm755 ${pkgdir}/usr/src/vtunerc-${pkgver}/patches
	cp \
		${srcdir}/vtuner.linux-driver-rel${pkgver}/* \
		${srcdir}/dkms.conf \
		${pkgdir}/usr/src/vtunerc-${pkgver}
	cp ${srcdir}/*.patch ${pkgdir}/usr/src/vtunerc-${pkgver}/patches
	install -Dm644 ${srcdir}/93-vtunerc.rules ${pkgdir}/usr/lib/udev/rules.d/93-vtunerc.rules
}
