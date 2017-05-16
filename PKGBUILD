# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=aif
pkgver=1.10
#_pkgver=${pkgver}-BETA # currently at beta release
_pkgver=${pkgver} # currently at stable release
pkgrel=2
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
sha512sums=('6c58735bfd7441a6ad94e0647fe254dd3d085a5dcff7783834d0e5849f115f0d3a4e43fa8e04cdc841e01690afe2193bc882b8f4354bf5cf3acb2cbe0b59d096'
            'SKIP')
package() {
        install -D -m0755 ${srcdir}/${_pkgname}-${_pkgver}/${pkgname}client.py ${pkgdir}/usr/bin/${pkgname}
        install -D -m0755 ${srcdir}/${_pkgname}-${_pkgver}/${pkgname}-config.py ${pkgdir}/usr/bin/${pkgname}-config
	install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/docs/examples/${pkgname}.xml ${pkgdir}/usr/share/doc/${pkgname}/examples/${pkgname}.xml
	install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/docs/examples/${pkgname}-secure.xml ${pkgdir}/usr/share/doc/${pkgname}/examples/${pkgname}-alternate.xml
        install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/${pkgname}.xsd ${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.xsd
        install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/docs/TODO ${pkgdir}/usr/share/doc/${pkgname}/TODO
        install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/docs/README.adoc ${pkgdir}/usr/share/doc/${pkgname}/README.adoc
	install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/docs/images/fig1.1.png ${pkgdir}/usr/share/doc/${pkgname}/images/fig1.1.png
        install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/extras/systemd.unit ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
        install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/extras/mkinitcpio.hook ${pkgdir}/usr/lib/initcpio/hooks/${pkgname}
        install -D -m0644 ${srcdir}/${_pkgname}-${_pkgver}/extras/mkinitcpio.install ${pkgdir}/usr/lib/initcpio/install/${pkgname}
	curl -s -o ${pkgdir}/usr/share/doc/${pkgname}/README.html https://aif.square-r00t.net/
	# TODO: xml linter, script samples. and docs, when i write them.
}
