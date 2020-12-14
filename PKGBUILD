# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=check_mk-agent
pkgver=1.6.0p19
pkgrel=1
pkgdesc='Agent to send information to a Check_MK server'
arch=(any)
url='https://mathias-kettner.de/'
license=('GPLv2')
makedepends=('git')
source=("${pkgname}-check_mk_agent.linux-${pkgver}::https://raw.githubusercontent.com/tribe29/checkmk/v${pkgver}/agents/check_mk_agent.linux"
        "${pkgname}-check_mk_caching_agent.linux-${pkgver}::https://raw.githubusercontent.com/tribe29/checkmk/v${pkgver}/agents/check_mk_caching_agent.linux"
        "${pkgname}-check_mk@.service-${pkgver}::https://raw.githubusercontent.com/tribe29/checkmk/v${pkgver}/agents/cfg_examples/systemd/check_mk%40.service"
        "${pkgname}-check_mk.socket-${pkgver}::https://raw.githubusercontent.com/tribe29/checkmk/v${pkgver}/agents/cfg_examples/systemd/check_mk.socket")
sha256sums=('e6bd06dc9afabab87be8b85134b7489bfb567aa6f96706cbdfb216193e7e3df3'
            '42acee5ef705040cf8b84c0d43731ff9c4134bc04926bf6ebac3538e9e54a79d'
            '7a8507af8fd92a7acc68c34d6a7525b67e0c0419ef8a99cd620d459837c7d1e8'
            'a891bb3020f20ff8e6c1672e58607dd5545923bfce6420911fd1c967ec500b08')

package() {
	ls -l
	install -D -m0755 ${pkgname}-check_mk_agent.linux-${pkgver} "${pkgdir}"/usr/bin/check_mk_agent
	install -D -m0755 ${pkgname}-check_mk_caching_agent.linux-${pkgver} "${pkgdir}"/usr/bin/check_mk_caching_agent

	install -D -m0644 ${pkgname}-check_mk@.service-${pkgver} "${pkgdir}"/usr/lib/systemd/system/check_mk@.service
	install -D -m0644 ${pkgname}-check_mk.socket-${pkgver} "${pkgdir}"/usr/lib/systemd/system/check_mk.socket

	install -d -m0755 "${pkgdir}"/var/lib/check_mk_agent/{cache,job,spool,local,plugins}
}
