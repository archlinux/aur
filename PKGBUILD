# Maintainer: Gregory Gleason <gsgleason@gmail.com>
# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: Dmitry Nosachev <quartz64@gmail.com>

pkgname=ipmicfg
pkgver=1.32.0
pkgrel=200910
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
    "f484080aaa1bbb60327249e0818acf3671588c0f6fb3c46e53cc60636a586b33"
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


