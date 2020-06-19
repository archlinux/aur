# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname='vtunerc-dkms'
pkgdesc='Kernel module to create virtual DVB devices'
pkgver=1.4
pkgrel=11
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='http://code.google.com/p/vtuner'
license=('GPL2')
depends=('linux>=3.3' 'dkms')
conflicts=('vtuner-module' 'vtuner-module-lts')
source=("vtuner.linux-driver-rel${pkgver}.tar.gz::https://github.com/lecotex/vtuner.linux-driver/archive/rel${pkgver}.tar.gz"
        'kernel-3.10.patch'
        'kernel-4.2.patch'
        'kernel-4.6.patch'
        'kernel-4.15.patch'
        'kernel-4.16.patch'
        'kernel-4.19.patch'
        'kernel-5.3.patch'
        'kernel-5.4.patch'
        'kernel-5.6.patch'
        'replace-Z-with-z.patch'
        'tweaks.patch'
        '93-vtunerc.rules'
        'dkms.conf')
sha256sums=('c6ba0cfd808e3f8473a5ea25d4ac2871b826edc62de5f3624c0bd812aad63bc1'
            '3da500773c6cc2f07a636d0a9f20cd1ac5106ddcd684f80ccd714ee26f7e7498'
            'e66d690f3cddab61a8a3e6172caefb0877aa240225af4683bcc433718cece242'
            '1f1318695d96ab9a1b217b83654293c78ee8c86be957f09e8180359b73736a61'
            'ae701414fee3c96fc8a2a5f705c534d4933485e6b28fab94d912f63395d184b7'
            '2e8a410409bba057d61ae8b1005a13cb1f359caa562b846e37b5db0448d62395'
            'c7bc232a5743a0fc4e80f9f72c6e27c2d82444cc307b1835873f63ae10c7efae'
            '7b0834bf8580aeb40ebedd4766368045d63e03af4d860cbbe4df8ebe2925123f'
            'b93588eb487fae99c8a74fe1d84f6140d1d51450b2e69d8d9efe16af9a0d8a06'
            '8b410a9aa7b34c0c3b14d7cff9d0e8376673c483eb65d449de6270680a385dab'
            '64cfd76c471ab3634711bc2e30dee90ae6498815b970014fe68adcbd50ad3741'
            '723631658d0a630538f5ab4f87afd69b551a636a31ddb05e6ab13c0a9e5244a1'
            '4b2d860cac8c8bab2d8fa79760d4405bef6fd042f4e78b680d25d1a5ebcbf83d'
            'f203bd7fe6bb23ed808a4a3866ec08445f5dc3095f646425c640dc519df72118')

package() {
	install -dm755 ${pkgdir}/usr/src/vtunerc-${pkgver}/patches
	cp \
		${srcdir}/vtuner.linux-driver-rel${pkgver}/* \
		${srcdir}/dkms.conf \
		${pkgdir}/usr/src/vtunerc-${pkgver}
	cp ${srcdir}/*.patch ${pkgdir}/usr/src/vtunerc-${pkgver}/patches
	install -Dm644 ${srcdir}/93-vtunerc.rules ${pkgdir}/usr/lib/udev/rules.d/93-vtunerc.rules
}
