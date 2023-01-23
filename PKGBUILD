# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=check_mk-agent
pkgver=2.1.0p19
pkgrel=1
pkgdesc='Agent to send information to a Check_MK server'
arch=(any)
url='https://mathias-kettner.de/'
license=('GPLv2')
makedepends=('git')
source=("${pkgname}-check_mk_agent.linux-${pkgver}::https://raw.githubusercontent.com/tribe29/checkmk/v${pkgver}/agents/check_mk_agent.linux"
        "${pkgname}-check_mk_caching_agent.linux-${pkgver}::https://raw.githubusercontent.com/tribe29/checkmk/v${pkgver}/agents/check_mk_caching_agent.linux"
        'check_mk.socket'
        'check_mk@.service')
sha256sums=('89bb33dc3820eb8c60e81f744a1fc323f9b19f432006d3f24e3364810248da97'
            'c29a519a75fec898d8c748da16f2cdecff210c11872c206873aa1374e793f87b'
            'a891bb3020f20ff8e6c1672e58607dd5545923bfce6420911fd1c967ec500b08'
            '7a8507af8fd92a7acc68c34d6a7525b67e0c0419ef8a99cd620d459837c7d1e8')

package() {
	ls -l
	install -D -m0755 ${pkgname}-check_mk_agent.linux-${pkgver} "${pkgdir}"/usr/bin/check_mk_agent
	install -D -m0755 ${pkgname}-check_mk_caching_agent.linux-${pkgver} "${pkgdir}"/usr/bin/check_mk_caching_agent

	install -D -m0644 -t "${pkgdir}"/usr/lib/systemd/system/ check_mk.socket check_mk@.service

	install -d -m0755 "${pkgdir}"/var/lib/check_mk_agent/{cache,job,spool,local,plugins}
}
