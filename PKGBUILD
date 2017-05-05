# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=aif
pkgver=0.01
_pkgver=${pkgver}-BETA # currently at beta release
#_pkgver=${pkgver} # currently at stable release
pkgrel=3
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
sha512sums=('209636b1b014fb5b05b0cdf5c514c897bf96acd2d7a1745d9bb64701344f912b1515e84a38210425931ffd530c047ebdefd1a5a2d43fe99c6126c421c631cd9b'
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
