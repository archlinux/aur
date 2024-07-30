# Maintainer: Gregory Gleason <gsgleason@gmail.com>
# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: Dmitry Nosachev <quartz64@gmail.com>

pkgname=ipmicfg
pkgver=1.35.2
pkgrel=240627
pkgdesc="Supermicro IPMI configuration tool"
makedepends=("unzip" "python-html2text")
depends=("glibc")
arch=("x86_64")
license=("custom:Super Micro Computer")
url="https://www.supermicro.com/en/solutions/management-software/ipmi-utilities"
source=(
    "https://www.supermicro.com/Bios/sw_download/760/IPMICFG_1.35.2_build.240627.zip"
    "https://www.supermicro.com/about/policies/disclaimer.cfm"
    )
sha256sums=(
    "5cb3dad030680772ac6160f9826f3baaba10aba2072cb9d5ec8e4a4db94e81da"
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


