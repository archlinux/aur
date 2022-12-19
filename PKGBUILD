# Maintainer: Ning Sun <n@sunng.info>

pkgname=questdb
pkgver=6.6.1
pkgrel=1
pkgdesc='Fast timeseries database'
arch=('any')
url='https://questdb.io'
license=('APACHE')
depends=('java-runtime' 'bash')
install='questdb.install'
source=(https://github.com/questdb/questdb/releases/download/${pkgver}/questdb-${pkgver}-no-jre-bin.tar.gz
    'questdb.sh'
    'questdb.sysusers'
    'questdb-tmpfile.conf'
    'questdb.service')
sha1sums=('SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP')

package() {
    mkdir -p ${pkgdir}/{usr/bin,usr/share/java/questdb,etc/questdb,var/lib/questdb}

    tar xf questdb-${pkgver}-no-jre-bin.tar.gz
    cp questdb-${pkgver}-no-jre-bin/questdb.jar ${pkgdir}/usr/share/java/questdb/questdb.jar

    install -Dm755 questdb.sh ${pkgdir}/usr/bin/questdb
    install -Dm644 ${srcdir}/questdb.service ${pkgdir}/usr/lib/systemd/system/questdb.service
    install -Dm644 ${srcdir}/questdb.sysusers ${pkgdir}/usr/lib/sysusers.d/questdb.conf
    install -Dm644 ${srcdir}/questdb-tmpfile.conf ${pkgdir}/usr/lib/tmpfiles.d/questdb.conf
}
