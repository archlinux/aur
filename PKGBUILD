# Maintainer: tioguda <guda.flavio@gmail.com>

_pkgname=ddutility
pkgname=ddutility-bin
pkgver=1.5
pkgrel=3
pkgdesc="Write and Backup Operating System IMG and ISO files on Memory Card or Disk"
arch=('any')
license=('custom')
url="https://www.thefanclub.co.za/how-to/dd-utility-write-and-backup-operating-system-img-and-iso-files-memory-card-or-disk"
depends=('lsof' 'udevil' 'zensu' 'xz' 'coreutils' 'bash' 'gzip' 'zip' 'zenity')
conflicts=('ddutility-bin-pt-br')
provides=('ddutility')
source=("https://raw.githubusercontent.com/thefanclub/dd-utility/master/DEB/${_pkgname}_${pkgver}_all.deb"
        'fix.patch')
sha256sums=('49417d46f41550ef1346670269f7d08be499ef4127fca99d762dfb90942ce445'
            '2310c088aa0944aea965f7182a1812ae42ee31d3bd4362b542988f8ddfeffc66')

prepare() {
    tar -xJf data.tar.xz
    patch -p1 -i ./fix.patch
}

package_ddutility-bin() {
    cd "$srcdir"
    # dump usr files to /usr
    mv usr "$pkgdir"
    # dump opt files to /opt
    mv opt "$pkgdir"

    install -Dm644 "${pkgdir}/usr/share/doc/ddutility/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
