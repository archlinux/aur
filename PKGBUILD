# Maintainer: BigfootACA <bigfoot@classfun.cn>
pkgname=secureboot-utils
pkgver=1.1
pkgrel=2
pkgdesc="UEFI SecureBoot Utils (Generate, Write, Sign)"
arch=(any)
url="https://github.com/BigfootACA/secureboot-utils"
license=('LGPL2.1')
options=(emptydirs)
depends=(openssl efitools sbsigntools)
optdepends=(
	'linux: sign kernel image for UEFI stub boot.'
	'linux-lts: sign kernel image for UEFI stub boot.'
	'systemd: sign systemd-boot for UEFI boot.'
	'polkit'
	'sudo'
)
provides=(
	secureboot-sign
	secureboot-write
	secureboot-keygen
)
source=(
	98-secureboot-linux.hook
	98-secureboot-linux-lts.hook
	99-secureboot-systemd.hook
	secureboot-keygen
	secureboot-sign
	secureboot-write
)
sha256sums=(
	48842d4640a0fbc872b624180c8645788585a299effc8c84345f494f2bc2d41b
	06b3ba841f7c69d1d9f616b461e68ea4161c04f8224240a23f8eadf752b09997
	39b759b12018e6aeaea369e0c5fd97a3443200febf461261c227a4c5ab02f5ff
	37510e0048652e4dedc67aadb19380a644024f1dec636b12eae1cc3726c959b2
	e45182631224e7aeef911de6e524c28c82c1b4cc92bcfcba7b518288bc763696
	8961c3d7eb76fbc48be6d555f41aa85eb84820ef4577271614503589ceded461
)
package(){
	install -D -m755 secureboot-sign "$pkgdir/usr/bin/secureboot-sign"
	install -D -m755 secureboot-write "$pkgdir/usr/bin/secureboot-write"
	install -D -m755 secureboot-keygen "$pkgdir/usr/bin/secureboot-keygen"
	install -D -m644 98-secureboot-linux.hook "$pkgdir/usr/share/libalpm/hooks/98-secureboot-linux.hook"
	install -D -m644 98-secureboot-linux-lts.hook "$pkgdir/usr/share/libalpm/hooks/98-secureboot-linux-lts.hook"
	install -D -m644 99-secureboot-systemd.hook "$pkgdir/usr/share/libalpm/hooks/99-secureboot-systemd.hook"
	mkdir -p "$pkgdir/etc/secureboot/local"
	mkdir -p "$pkgdir/etc/secureboot/microsoft"
}
