# Maintainer: eomanis at web dot de

pkgname='disk-test'
_pkgverUpstream="0.2.2"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="Block device read-write test utility written in bash"
arch=('any')
url='https://eomanis.duckdns.org/permshare/disk-test/'
license=('GPL3')
depends=('bash' 'coreutils' 'diffutils' 'grep' 'openssl' 'pv' 'sed' 'util-linux')
source=("https://eomanis.duckdns.org/permshare/disk-test/disk-test-${_pkgverUpstream}.tar.gz")
sha384sums=('38e21f48ab61171a409218dfb26677c9037436b3f163c7abbe814dfd870bdfdb29954d7744f715dab682ae3a4f5f232f')

package() {
    local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"
    
    # Place the main bash script into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcRootDir}/disk-test"
    chmod u=rwx,go=rx "disk-test"
    
    # Gzip and place the manual page
    mkdir -p "${pkgdir}/usr/share/man"
    cd "${pkgdir}/usr/share/man"
    mkdir "man1"
    gzip --fast --to-stdout - < "${srcRootDir}/disk-test.1" > "man1/disk-test.1.gz"
    chmod -R u=rwX,go=rX .
}
