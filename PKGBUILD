# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='pulse-autoconf'
_pkgverUpstream="1.10.0"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="PulseAudio server dynamic configuration daemon"
arch=('any')
url='https://eomanis.duckdns.org/permshare/pulse-autoconf/'
license=('GPL3')
depends=('bash' 'bc' 'coreutils' 'findutils' 'grep' 'libpulse' 'sed' 'util-linux')
source=("https://eomanis.duckdns.org/permshare/pulse-autoconf/pulse-autoconf-${_pkgverUpstream}.tar.gz")
sha384sums=('4282000badb6e8ac2519963d51ce4206d1786bf88866506d74a3c1639954eadd0c59b321be61c50911eb7edc712c8368')

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
