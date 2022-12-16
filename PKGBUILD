# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=rsync-readcap
pkgver=0.2
pkgrel=1
pkgdesc="Create copy of rsync with read-everywhere capability under rsyncr user. For pull backups."
arch=("any")
url="https://doc.vejnar.org/doc/storage/backup"
license=("Unlicense")
depends=("rsync")
install="rsync-readcap.install"
source=("rsync-readcap.hook"
        "rsync-readcap.sysusers")
sha256sums=('1c1047f64db7734dd9a661d7c9a84099e7e9e23412ea8c1518af6ed8ede1d55e'
            '247ee09e1d8fff992347afc14b193aeaaca17f67a87cddc6507dba777919f07e')

package() {
    cd "$srcdir"

    install -dm 700 "${pkgdir}/var/lib/${pkgname}"
    install -Dm 700 /usr/bin/rsync "$pkgdir/var/lib/${pkgname}/"

    install -Dm 644 ${pkgname}.hook "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
    install -Dm 644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
