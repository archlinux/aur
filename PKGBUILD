# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='pulse-autoconf'
_pkgverUpstream="1.10.2"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=2
pkgdesc="PulseAudio server dynamic configuration daemon"
arch=('any')
url='https://www.eomanis.dedyn.io/permshare/pulse-autoconf/'
license=('GPL3')
depends=('bash' 'bc' 'coreutils' 'findutils' 'grep' 'libpulse' 'sed' 'util-linux')
source=("https://www.eomanis.dedyn.io/permshare/pulse-autoconf/pulse-autoconf-${_pkgverUpstream}.tar.gz")
sha384sums=('35447acbedb2b0d41646f222cd3c4fe340eef484920e01ba89195fcf0ffdb9f7979f77b3990c39c526d27a5326a07f19')

package () {
    local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"

    # Create the required directories
    install --mode=u=rwx,go=rx --directory \
        "${pkgdir}/usr/bin" \
        "${pkgdir}/usr/lib/systemd/user" \
        "${pkgdir}/usr/share/applications"

    # Place the files
    install --mode=u=rwx,go=rx  --target-directory="${pkgdir}/usr/bin"                  "${srcRootDir}/pulse-autoconf"
    install --mode=u=rw,go=r    --target-directory="${pkgdir}/usr/lib/systemd/user"     "${srcRootDir}/systemd/pulse-autoconf.service"
    install --mode=u=rw,go=r    --target-directory="${pkgdir}/usr/share/applications"   "${srcRootDir}/freedesktop/pulse-autoconf.desktop"
}
