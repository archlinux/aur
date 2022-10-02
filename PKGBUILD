# Maintainer: Gregory Gleason <gsgleason@gmail.com>
# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: Dmitry Nosachev <quartz64@gmail.com>

pkgname=ipmicfg
pkgver=1.34.0
pkgrel=220906
pkgdesc="Supermicro IPMI configuration tool"
makedepends=("unzip" "python-html2text")
depends=("glibc")
arch=("x86_64")
license=("custom:Super Micro Computer")
url="https://www.supermicro.com/en/solutions/management-software/ipmi-utilities"
source=(
    "https://www.supermicro.com/Bios/sw_download/481/IPMICFG_1.34.0_build.220906.zip"
    "https://www.supermicro.com/about/policies/disclaimer.cfm"
    )
sha256sums=(
    "1b06d18ae14f1a8f4c2a70ebe414a71cea77c5b050ecacd21088f7dd6b8ac0c9"
    "SKIP"
    )

package() {
	install -d -m 755 "${pkgdir}/usr/lib/ipmicfg"
	install -d -m 755 "${pkgdir}/usr/bin"

	cp -dpr --no-preserve=ownership "${srcdir}/IPMICFG_${pkgver}_build.${pkgrel}/Linux/64bit/"* ${pkgdir}/usr/lib/ipmicfg
	chmod a+rx ${pkgdir}/usr/lib/ipmicfg/IPMICFG-Linux.${CARCH}
	ln -s /usr/lib/ipmicfg/IPMICFG-Linux.${CARCH} ${pkgdir}/usr/bin/ipmicfg
    html2text --ignore-emphasis --ignore-links "${srcdir}/disclaimer.cfm" | sed "s/\\\./\./g" > LICENSE
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


