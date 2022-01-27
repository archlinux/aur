# Maintainer: Gregory Gleason <gsgleason@gmail.com>
# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: Dmitry Nosachev <quartz64@gmail.com>

pkgname=ipmicfg
pkgver=1.33.0
pkgrel=210528
pkgdesc="Supermicro IPMI configuration tool"
makedepends=("unzip" "python-html2text")
depends=("glibc")
arch=("x86_64")
license=("custom:Super Micro Computer")
url="http://www.supermicro.com/products/nfo/ipmi.cfm"
source=(
    "https://www.supermicro.com/wftp/utility/IPMICFG/IPMICFG_${pkgver}_build.${pkgrel}.zip"
    "https://www.supermicro.com/about/policies/disclaimer.cfm"
    )
sha256sums=(
    "25d3d6700346a0349053fd8c01b57fefd83d78510b22e59989702d5c62b40c82"
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


