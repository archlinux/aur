# Maintainer: eomanis at web dot de

pkgname='pulse-autoconf'
_pkgverUpstream="1.7.1"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="PulseAudio server dynamic configuration daemon"
arch=('any')
url='https://eomanis.duckdns.org/permshare/pulse-autoconf/'
license=('GPL3')
depends=('bash' 'bc' 'coreutils' 'findutils' 'grep' 'libpulse' 'sed' 'util-linux')
source=("https://eomanis.duckdns.org/permshare/pulse-autoconf/pulse-autoconf-${_pkgverUpstream}.tar.gz")
sha384sums=('512f9be5373eabdd4348791ebcd2830880c2c5f32d445e737d18c6ef8682f5fbc63112a6da3cc4b427609b887c441f88')

package() {
    local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"

    # Place the main bash script into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcRootDir}/pulse-autoconf"
    chmod u=rwx,go=rx "pulse-autoconf"

    # Place the Desktop Entry file into /usr/share/applications
    mkdir -p "${pkgdir}/usr/share/applications"
    cd "${pkgdir}/usr/share/applications"
    cp -t . "${srcRootDir}/pulse-autoconf.desktop"
    chmod u=rw,go=r "pulse-autoconf.desktop"

    # Place the systemd unit file into /usr/lib/systemd/user
    mkdir -p "${pkgdir}/usr/lib/systemd/user"
    cd "${pkgdir}/usr/lib/systemd/user"
    cp -t . "${srcRootDir}/systemd/pulse-autoconf.service"
    chmod u=rw,go=r "pulse-autoconf.service"
}
