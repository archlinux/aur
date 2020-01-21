#!/bin/bash
# Contributor: Mimas <mimasgpc+pkgbuild@free.fr> (http://forums.archlinux.fr/topic5585.html)
# Contributor: acoolon <@web.de>
# Maintainer: jorge_barroso <jorge.barroso.11@gmail.com>

pkgname=adsuck
pkgver=2.5.0
pkgrel=5
pkgdesc="DNS filter"
arch=(any)
backup=('var/adsuck/filter')
url=https://github.com/conformal/adsuck
license=(BSD)
depends=(ldns libevent)
install=adsuck.install
source=("https://github.com/conformal/adsuck/archive/ADSUCK_2_5_0.tar.gz"
        50-adsuck-update filter adsuck.service)
sha512sums=('db29e7f1e40cdabdcd43acaf0cff89996b2283b2c7a935cba3146203ab33745ef08ca7dfa8e462eb8aefd621c1b887d6afc8c1f2229473e4725be50c8779c996'
            'bed32b5aa6174a7973d2405e6b6f9ab33434e493043222329d6ecf8982a939bb029720b590668276031f0d049cea7b9fd4c127daec502e2b08877cf151476dde'
            'b0a76aeb116c058b888d21b119d44a2eccb1410cd7b1987b5167059855091bb6b52b8ec9ebd8504ba9d82a1489e52c8d3a19927f0841161977f7a8d8f3a7e58e'
            '74f33eb005187cb48eca121f8b05001823f0df5c9d244755d53061b91b8dd2bc8e8fa645b183420fc01f938724af8882b40844d797843b6cc16e57f83c1a06ad')

build()
{
  cd "${srcdir}/adsuck-ADSUCK_2_5_0"
  make -f GNUmakefile adsuck
}

package()
{
  install -D -m700 "${srcdir}/adsuck-ADSUCK_2_5_0/adsuck" "${pkgdir}/usr/sbin/adsuck"
  install -D  "${srcdir}/adsuck-ADSUCK_2_5_0/adsuck.8" "${pkgdir}/usr/share/man/man8/adsuck.8"
  install -D -m644 "${srcdir}/filter" "${pkgdir}/var/adsuck/filter"
  install -D -m755 "${srcdir}/adsuck.service" "${pkgdir}/usr/lib/systemd/system/adsuck.service"
  # uncomment if you want it
  #install -D -m755 "${srcdir}/50-adsuck-update" "${pkgdir}/usr/lib/dhcpcd/dhcpcd-hooks/50-adsuck-update"
}
