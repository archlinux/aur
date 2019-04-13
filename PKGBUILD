# Maintainer: eomanis at web dot de

pkgname='yabddnsd'
_pkgverUpstream="0.6.0"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=2
pkgdesc="Yet another bash dynamic DNS daemon"
arch=('any')
url='http://eomanis.mooo.com/permshare/yabddnsd/index.xhtml'
license=('GPL3')
depends=('bash>=4.4' 'grep' 'sed' 'wget' 'bind-tools' 'coreutils' 'iproute2' 'bc')
optdepends=('miniupnpc: Detection of public IPv4 address using UPnP')
replaces=('freedns-maintain-ip')
source=("http://eomanis.mooo.com/permshare/yabddnsd/yabddnsd-${_pkgverUpstream}.tar.gz")
sha384sums=('41907cd9c4f75c05a4e90943b2867fcb6029d95ab08b92dc5efb518caff59ac6cb3c4d995f1c1028291e46844ef56ce2')

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
