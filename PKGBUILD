# Maintainer: eomanis at web dot de

pkgname='borgit'
_pkgverUpstream="0.1.0"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="Write your Borg backup jobs with sourced bash configuration files"
arch=('any')
url='https://eomanis.duckdns.org/permshare/borgit/'
license=('GPL3')
depends=('bash' 'borg' 'coreutils' 'findutils')
source=("https://eomanis.duckdns.org/permshare/borgit/borgit-${_pkgverUpstream}.tar.gz")
sha384sums=('9ee0dc071e8113aaecc37b0ae982a10379f8f273d9f76e4feaaea0a95cfb49987076096ac79a4e321c5d0ae0b5e67af8')

package() {
    local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"
    
    # Place the main bash scripts into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcRootDir}/borgit"
    chmod u=rwx,go=rx "borgit"
    cp -t . "${srcRootDir}/borgem"
    chmod u=rwx,go=rx "borgem"
    
    # Gzip and place the manual pages
    mkdir -p "${pkgdir}/usr/share/man"
    cd "${pkgdir}/usr/share/man"
    mkdir "man1"
    cd "man1"
    gzip --fast --to-stdout - < "${srcRootDir}/borgit.1" > "borgit.1.gz"
    gzip --fast --to-stdout - < "${srcRootDir}/borgem.1" > "borgem.1.gz"
    cd - > /dev/null
    chmod -R u=rwX,go=rX .
}
