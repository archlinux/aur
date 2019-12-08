# Maintainer: eomanis at web dot de

pkgname='borgit'
_pkgverUpstream="0.0.3"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="Write your Borg backup jobs with sourced bash configuration files"
arch=('any')
url='https://eomanis.duckdns.org/permshare/borgit/'
license=('GPL3')
depends=('bash' 'coreutils' 'borg')
source=("https://eomanis.duckdns.org/permshare/borgit/borgit-${_pkgverUpstream}.tar.gz")
sha384sums=('cfdd4856a2b1b87922a08cfa9bea2c210b0a349a25042a87f00ca065c7e1d39a8460ec62f65fabed29d1e36715afd082')

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
