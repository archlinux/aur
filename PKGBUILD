# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
# Contributor: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Romain "Artefact2" Dal Maso <artefact2@gmail.com>

_pkgbase=v4l2loopback
_reponame=${_pkgbase}-obs
pkgname=${_pkgbase}-obs-dkms
pkgver=0.13.4
pkgrel=1
pkgdesc="v4l2-loopback backport compatible with obs-studio"
url="https://github.com/ticpu/${_reponame}.git"
arch=('any')
license=('GPL2')
depends=('dkms')
makedepends=('git' 'help2man')
conflicts=("${_pkgbase}-dkms" "${_reponame}-dkms-git")
provides=("${_pkgbase}-dkms")
validpgpkeys=(
	'E5998E49DC9E1DCFDB9B46EC77EBA10790CFFCCD' # Jérôme Poulin <jeromepoulin@gmail.com>
)
#source=("git+${url}?signed#commit=021214ccd3474bcd1e792e7e4deb27a95e7454a5")
source=("git+${url}?signed#tag=v${pkgver}")
sha512sums=('SKIP')

package() {
    cd "${srcdir}/${_reponame}"
    mkdir -p "${pkgdir}/usr/share/licenses/${_pkgbase}"
    cp -vf COPYING "${pkgdir}/usr/share/licenses/${_pkgbase}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install-utils install-man
    mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    cp -ar * "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
}
