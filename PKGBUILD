# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname=epsxe-plugin-spu-eternal
pkgver=1.41
pkgrel=2
pkgdesc="Epsxe Eternal SPU plugin"
url="https://web.archive.org/web/20050404072132/http://www1.odn.ne.jp/psx-alternative/"
depends=('epsxe' 'libstdc++296')
optdepends=('ossp')
source=('https://web.archive.org/web/20050404072132/http://www1.odn.ne.jp/psx-alternative/download/spuEternal141_linux.tgz'
        'epsxe-plugin-spu-eternal.install')
md5sums=('65e3cd9edcbce6ea74f0dbe9ab794784'
         '23c360ad5cf88d58b120da5782bebf4f')
license=('custom')
arch=('i686' 'x86_64')
install=epsxe-plugin-spu-eternal.install
backup=('opt/epsxe/cfg/spuEternal.cfg')

package () {
    cd $srcdir/

    # Doc
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
                                                "readme(e).txt" "readme(j).txt"

    # Readme
    install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    grep -A6 "This program is freeware" "readme(e).txt" \
                            > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Plugin lib
    install -m 775 -o root -g games -d "${pkgdir}/opt/epsxe/plugins"
    install -m 755 -o root -g games -t "${pkgdir}/opt/epsxe/plugins" \
                                                          libspuEternal.so.1.41

    # Config
    install -m 775 -o root -g games -d "${pkgdir}/opt/epsxe/cfg"
    touch "${pkgdir}/opt/epsxe/cfg/spuEternal.cfg"
    chown root:games "${pkgdir}/opt/epsxe/cfg/spuEternal.cfg"
    chmod 775 "${pkgdir}/opt/epsxe/cfg/spuEternal.cfg"
}
