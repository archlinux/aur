# Maintainer: eomanis at web dot de

pkgname='borgit'
_pkgverUpstream="0.0.4"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="Write your Borg backup jobs with sourced bash configuration files"
arch=('any')
url='https://eomanis.duckdns.org/permshare/borgit/'
license=('GPL3')
depends=('bash' 'coreutils' 'borg')
source=("https://eomanis.duckdns.org/permshare/borgit/borgit-${_pkgverUpstream}.tar.gz")
sha384sums=('2ec3ebf280dfe86f7996a0284ffe251d6eeca5c711f3d9028f88d37688e330411ddecaa811ef8f00e2f333159fcff326')

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
