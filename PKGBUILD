# Maintainer: eomanis at web dot de

pkgname='borgit'
_pkgverUpstream="0.0.2"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="Write your Borg backup jobs with sourced bash configuration files"
arch=('any')
url='https://eomanis.duckdns.org/permshare/borgit/'
license=('GPL3')
depends=('bash' 'coreutils' 'borg')
source=("https://eomanis.duckdns.org/permshare/borgit/borgit-${_pkgverUpstream}.tar.gz")
sha384sums=('81c53bf9a7c60f82115937d679435bc1d40914a814ffcf62adb9deff1e595667dd026783afec0e1d4e93761a19f19daa')

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
