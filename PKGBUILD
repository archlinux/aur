# Contributor: Aleksandr <contact at via dot aur>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=activemq
pkgver=5.18.2
pkgrel=1
pkgdesc="Popular and powerful open source messaging and Integration Patterns provider"
arch=('x86_64')
url="https://activemq.apache.org"
license=('Apache 2.0')
depends=('java-runtime' 'lsb-release')
source=("https://dlcdn.apache.org/${pkgname}/${pkgver}/apache-${pkgname}-${pkgver}-bin.tar.gz"
	    'service'
	    'sysusers')
sha256sums=('cd3df3ec2f791d47f4351bc0e5d5f9880c220a451a31820edbf839962ec8430a'
            '8a3dbf1130cb66beef6d5bb84636594bbd090663e4ccca5214c8269e0c8a6e1f'
            '3898131d4c696828dd2cca793907417db9471ad6bf9c8014d25a4995796daff7')
options=(!strip)
install=install

package() {
    install -dm0755 "${pkgdir}/opt/${pkgname}"
    install -dm0755 "${pkgdir}/usr/lib/sysusers.d"
    install -D -m0644 sysusers "${pkgdir}/usr/lib/sysusers.d/activemq.conf"
    install -D -m0644 service "${pkgdir}/usr/lib/systemd/system/activemq.service"
    mv apache-${pkgname}-${pkgver} "${pkgdir}/opt/${pkgname}/"
    ln -s /opt/activemq/apache-${pkgname}-${pkgver} ${pkgdir}/opt/${pkgname}/current
}

