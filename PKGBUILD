# Maintainer: Ning Sun <n@sunng.info>

pkgname=questdb
pkgver=7.3.5
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
sha1sums=('4b61ca18262084681a93887d024b8acefad72035'
          'cf89748006a65bd09ad8f57ca76b58f1ec3a053e'
          '79459d2e7ab4a78364359cb40368bbc0778fd9cf'
          'bcd990f6257a0501c82a03384a9d4c5703b03abb'
          'ec5400e458e7511abb8e455710041352f15b87ab')

package() {
    mkdir -p ${pkgdir}/{usr/bin,usr/share/java/questdb,etc/questdb,var/lib/questdb}

    tar xf questdb-${pkgver}-no-jre-bin.tar.gz
    cp questdb-${pkgver}-no-jre-bin/questdb.jar ${pkgdir}/usr/share/java/questdb/questdb.jar

    install -Dm755 questdb.sh ${pkgdir}/usr/bin/questdb
    install -Dm644 ${srcdir}/questdb.service ${pkgdir}/usr/lib/systemd/system/questdb.service
    install -Dm644 ${srcdir}/questdb.sysusers ${pkgdir}/usr/lib/sysusers.d/questdb.conf
    install -Dm644 ${srcdir}/questdb-tmpfile.conf ${pkgdir}/usr/lib/tmpfiles.d/questdb.conf
}
