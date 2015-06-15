#!/bin/bash
# Contributor: Mimas <mimasgpc+pkgbuild@free.fr> (http://forums.archlinux.fr/topic5585.html)
# Contributor: acoolon <@web.de>
# Maintainer: jorge_barroso <jorge.barroso.11@gmail.com>

pkgname=adsuck
pkgver=2.5.0
pkgrel=4
pkgdesc="DNS filter"
arch=(any)
backup=('var/adsuck/filter')
url=http://opensource.conformal.com/wiki/Adsuck
license=(BSD)
depends=(ldns libevent)
install=adsuck.install
source=("http://opensource.conformal.com/snapshots/${pkgname}/${pkgname}-${pkgver}.tgz"
        50-adsuck-update filter adsuck.service)
sha512sums=('5c4a2747d77c7cafe6115814f342f6f63bc5aac049f3d061e25153727cd1885219b5c826579100e2620f3613de19520231c7472af77b709c0896f1b7f594a1db'
            'bed32b5aa6174a7973d2405e6b6f9ab33434e493043222329d6ecf8982a939bb029720b590668276031f0d049cea7b9fd4c127daec502e2b08877cf151476dde'
            'b0a76aeb116c058b888d21b119d44a2eccb1410cd7b1987b5167059855091bb6b52b8ec9ebd8504ba9d82a1489e52c8d3a19927f0841161977f7a8d8f3a7e58e'
            '74f33eb005187cb48eca121f8b05001823f0df5c9d244755d53061b91b8dd2bc8e8fa645b183420fc01f938724af8882b40844d797843b6cc16e57f83c1a06ad')

build()
{
  cd "${pkgname}-${pkgver}"
  make -f GNUmakefile adsuck
}

package()
{
  install -D -m700 "${srcdir}/${pkgname}-${pkgver}/adsuck" "${pkgdir}/usr/sbin/adsuck"
  install -D  "${srcdir}/${pkgname}-${pkgver}/adsuck.8" "${pkgdir}/usr/share/man/man8/adsuck.8"
  install -D -m644 "${srcdir}/filter" "${pkgdir}/var/adsuck/filter"
  install -D -m755 "${srcdir}/adsuck.service" "${pkgdir}/usr/lib/systemd/system/adsuck.service"
  # uncomment if you want it
  #install -D -m755 "${srcdir}/50-adsuck-update" "${pkgdir}/usr/lib/dhcpcd/dhcpcd-hooks/50-adsuck-update"
}
