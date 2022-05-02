# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='pulse-autoconf'
_pkgverUpstream="1.8.2"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="PulseAudio server dynamic configuration daemon"
arch=('any')
url='https://eomanis.duckdns.org/permshare/pulse-autoconf/'
license=('GPL3')
depends=('bash' 'bc' 'coreutils' 'findutils' 'grep' 'libpulse' 'sed' 'util-linux')
source=("https://eomanis.duckdns.org/permshare/pulse-autoconf/pulse-autoconf-${_pkgverUpstream}.tar.gz")
sha384sums=('5f14855fea35c6446988268e72ae459300a010755b6eeb099bd30e3b910cf60705655cb44757e0d7730ffbf0dec03d49')

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
