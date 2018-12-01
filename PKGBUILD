# Maintainer: eomanis at web dot de

pkgname='freedns-maintain-ip'
pkgverUpstream="0.5.0"
pkgver="${pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="DNS record updater for freedns.afraid.org domains written in bash"
arch=('any')
url='http://eomanis.mooo.com/permshare/freedns-maintain-ip/index.xhtml'
license=('GPL3')
depends=('bash>=4.4' 'grep' 'sed' 'wget' 'bind-tools' 'coreutils' 'iproute2' 'bc')
optdepends=('miniupnpc: Detection of public IPv4 address using UPnP')
source=("http://eomanis.mooo.com/permshare/freedns-maintain-ip/freedns-maintain-ip-${pkgverUpstream}.tar.gz")
sha384sums=('ffeccb542fd021cf28fb05c3d3a955369ad4344f4feed5428917dc5ec5c606ba3a2d104181d9529f390fd4a6469bebfa')

package() {
    
    # Place the main bash script into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcdir}/freedns-maintain-ip"
    chmod u=rwx,go=rx "freedns-maintain-ip"
    
    # Place the systemd unit file into /usr/lib/systemd/system
    mkdir -p "${pkgdir}/usr/lib/systemd/system"
    cd "${pkgdir}/usr/lib/systemd/system"
    cp -t . "${srcdir}/freedns-maintain-ip@.service"
    chmod u=rw,go=r "freedns-maintain-ip@.service"
    
    # Gzip and place the manual page
    mkdir -p "${pkgdir}/usr/share/man"
    cd "${pkgdir}/usr/share/man"
    mkdir "man8"
    gzip --fast --to-stdout - < "${srcdir}/freedns-maintain-ip.8" > "man8/freedns-maintain-ip.8.gz"
    chmod -R u=rwX,go=rX .
}
