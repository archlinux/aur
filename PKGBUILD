# Maintainer: eomanis at web dot de

pkgname='freedns-maintain-ip'
pkgver=0.1.0
pkgrel=1
pkgdesc="DNS record updater for freedns.afraid.org domains written in bash"
arch=('any')
url='http://eomanis.mooo.com/permshare/freedns-maintain-ip/index.xhtml'
license=('GPL3')
depends=('bash' 'sed' 'miniupnpc' 'wget' 'bind-tools' 'coreutils')
source=("http://eomanis.mooo.com/permshare/freedns-maintain-ip/freedns-maintain-ip-${pkgver}.tar.gz")
sha256sums=('d3e4e6d5691643de14aa0186f3571fe48163ed11a1985ad85ccd452c3da7e2a2')

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
