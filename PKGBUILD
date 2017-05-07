# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=aif
pkgver=1.00
#_pkgver=${pkgver}-BETA # currently at beta release
_pkgver=${pkgver} # currently at stable release
pkgrel=1
pkgdesc="An XML and python-driven rebirth of the AIF (Arch Installation Framework) project."
arch=( 'i686' 'x86_64' )
url="https://aif.square-r00t.net/"
license=( 'GPL3' )
depends=( 'python' 'arch-install-scripts' 'parted' 'gptfdisk' )
optdepends=( 'python-lxml: better XML handling' )
_pkgname=AIF-NG
conflicts=( 'aif-git' )
install=
changelog=
noextract=()
source=("${pkgname}-${pkgver}.tar.xz::https://git.square-r00t.net/${_pkgname}/snapshot/${_pkgname}-${_pkgver}.tar.xz"
        "${pkgname}-${pkgver}.tar.xz.sig")
sha512sums=('5456429d6a265d160903b2171e9dfe5f86a1554bdc725b841992c4bd9ad9157bf7444ca70eafd22a0dccee4d8d723cb1074332f2af1c3e08f61a239f8b581b78'
            'SKIP')
package() {
        install -D -m0755 ${srcdir}/${_pkgname}-${_pkgver}/${pkgname}client.py ${pkgdir}/usr/bin/${pkgname}
        install -D -m0755 ${srcdir}/${_pkgname}-${_pkgver}/${pkgname}verify.py ${pkgdir}/usr/bin/${pkgname}-verify
        install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/${pkgname}.xml ${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.xml
        install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/${pkgname}.xsd ${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.xsd
        install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/docs/TODO ${pkgdir}/usr/share/doc/${pkgname}/TODO
        install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/extras/systemd.unit ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
        install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/extras/mkinitcpio.hook ${pkgdir}/usr/lib/initcpio/hooks/${pkgname}
        install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/extras/mkinitcpio.install ${pkgdir}/usr/lib/initcpio/install/${pkgname}
	curl -s -o ${pkgdir}/usr/share/doc/${pkgname}/README.html https://aif.square-r00t.net/
	# TODO: xml linter, script samples. and docs, when i write them.
}
