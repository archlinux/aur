# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='pulse-autoconf'
_pkgverUpstream="1.8.1"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="PulseAudio server dynamic configuration daemon"
arch=('any')
url='https://eomanis.duckdns.org/permshare/pulse-autoconf/'
license=('GPL3')
depends=('bash' 'bc' 'coreutils' 'findutils' 'grep' 'libpulse' 'sed' 'util-linux')
source=("https://eomanis.duckdns.org/permshare/pulse-autoconf/pulse-autoconf-${_pkgverUpstream}.tar.gz")
sha384sums=('0ca3b1de98a33aa4f72f91e915e0c6bb08cf4f922691a2e5afbcfc34301e1409c84ed61e623c17fcbd9f7b76f634e3a5')

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
