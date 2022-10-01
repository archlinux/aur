# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='pulse-autoconf'
_pkgverUpstream="1.10.1"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="PulseAudio server dynamic configuration daemon"
arch=('any')
url='https://eomanis.duckdns.org/permshare/pulse-autoconf/'
license=('GPL3')
depends=('bash' 'bc' 'coreutils' 'findutils' 'grep' 'libpulse' 'sed' 'util-linux')
source=("https://eomanis.duckdns.org/permshare/pulse-autoconf/pulse-autoconf-${_pkgverUpstream}.tar.gz")
sha384sums=('a1737c881bdb45109d1be4d4eb3acf11be9408727cfec7fe0fc475352e02fd893a6f3dc8a69f5eff8cfe841672d44a8d')

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
