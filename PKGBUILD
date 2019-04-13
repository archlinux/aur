# Maintainer: eomanis at web dot de

pkgname='freedns-maintain-ip'
_pkgverUpstream="0.5.2"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=2
pkgdesc="DNS record updater for freedns.afraid.org domains written in bash"
arch=('any')
url='http://eomanis.mooo.com/permshare/yabddnsd/index.xhtml'
license=('GPL3')
depends=('bash>=4.4' 'grep' 'sed' 'wget' 'bind-tools' 'coreutils' 'iproute2' 'bc')
optdepends=('miniupnpc: Detection of public IPv4 address using UPnP')
source=("http://eomanis.mooo.com/permshare/yabddnsd/freedns-maintain-ip-${_pkgverUpstream}.tar.gz")
sha384sums=('5b4465329252468e4f8a38db0d4fed6de4d22526e94ec14950e1a8ede2eb06ac95f46db404ce95500f7ff43f31620515')

package() {
    
    srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"
    
    # Place the main bash script into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcRootDir}/freedns-maintain-ip"
    chmod u=rwx,go=rx "freedns-maintain-ip"
    
    # Place the systemd unit file into /usr/lib/systemd/system
    mkdir -p "${pkgdir}/usr/lib/systemd/system"
    cd "${pkgdir}/usr/lib/systemd/system"
    cp -t . "${srcRootDir}/freedns-maintain-ip@.service"
    chmod u=rw,go=r "freedns-maintain-ip@.service"
    
    # Gzip and place the manual page
    mkdir -p "${pkgdir}/usr/share/man"
    cd "${pkgdir}/usr/share/man"
    mkdir "man8"
    gzip --fast --to-stdout - < "${srcRootDir}/freedns-maintain-ip.8" > "man8/freedns-maintain-ip.8.gz"
    chmod -R u=rwX,go=rX .
}
