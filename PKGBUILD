# Maintainer: eomanis at web dot de

pkgname='yabddnsd'
_pkgverUpstream="0.6.1"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="Yet another bash dynamic DNS daemon"
arch=('any')
url='https://eomanis.duckdns.org/permshare/yabddnsd/index.xhtml'
license=('GPL3')
depends=('bash>=4.4' 'grep' 'sed' 'wget' 'bind-tools' 'coreutils' 'iproute2' 'bc')
optdepends=('miniupnpc: Detection of public IPv4 address using UPnP')
replaces=('freedns-maintain-ip')
source=("https://eomanis.duckdns.org/permshare/yabddnsd/yabddnsd-${_pkgverUpstream}.tar.gz")
sha384sums=('c010b81129862330ab48ea33b5137be43bf7ae0df241750c378ee0db3dfe29ac2a4df89adf062572e9440725a59d80bd')

package() {
    
    srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"
    
    # Place the main bash script into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcRootDir}/yabddnsd"
    chmod u=rwx,go=rx "yabddnsd"
    
    # Place the systemd unit file into /usr/lib/systemd/system
    mkdir -p "${pkgdir}/usr/lib/systemd/system"
    cd "${pkgdir}/usr/lib/systemd/system"
    cp -t . "${srcRootDir}/yabddnsd@.service"
    chmod u=rw,go=r "yabddnsd@.service"
    
    # Gzip and place the manual page
    mkdir -p "${pkgdir}/usr/share/man"
    cd "${pkgdir}/usr/share/man"
    mkdir "man8"
    gzip --fast --to-stdout - < "${srcRootDir}/yabddnsd.8" > "man8/yabddnsd.8.gz"
    chmod -R u=rwX,go=rX .
}
