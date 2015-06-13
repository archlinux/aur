# Maintainer: Dwayne Bent <dbb@dbb.io>
pkgname=systemd-cron
pkgver=1.5.3
pkgrel=1
pkgdesc='systemd units to run cron scripts'
arch=(any)
url='https://github.com/systemd-cron/systemd-cron'
license=('MIT')
depends=('systemd>=217' 'run-parts' 'python')
optdepends=('smtp-forwarder: sending emails')
provides=('cron')
conflicts=('cron')
source=("https://github.com/systemd-cron/${pkgname}/archive/v${pkgver}.tar.gz")
install=${pkgname}.install
md5sums=('15da1cb2e1171d24927e3241de6f7969')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure --prefix=/usr --confdir=/etc \
        --enable-minutely --enable-quarterly --enable-semi_annually --enable-yearly \
        --enable-persistent --enable-setgid
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

    install -d "${pkgdir}"/etc/cron.{boot,minutely,hourly,daily,weekly,monthly,quarterly,semi-annually,yearly}
    install -d "${pkgdir}"/var/spool/cron
}

