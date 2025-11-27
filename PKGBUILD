# Maintainer: FloTheSysadmin <FloTheSysadmin@protonmail.com>
#

pkgname=check_mk-agent
pkgver=2.4.0p12
pkgrel=1
pkgdesc='Agent to send information to a Check_MK server'
arch=(any)
url='https://checkmk.com/'
license=('GPLv2')
makedepends=('git')
source=("${pkgname}-check_mk_agent.linux-${pkgver}::https://raw.githubusercontent.com/tribe29/checkmk/v${pkgver}/agents/check_mk_agent.linux"
        "${pkgname}-check_mk_caching_agent.linux-${pkgver}::https://raw.githubusercontent.com/tribe29/checkmk/v${pkgver}/agents/check_mk_caching_agent.linux"
        'check_mk.socket'
        'check_mk@.service')
sha256sums=('b9c9882b572b6acbba3ce5008e3463fe8e9661a11147e2abc58c7391af69039c'
            '54bb693ef89cf65fa53440384b238e507193d5770f803854746335ccb2dd7162'
            'a891bb3020f20ff8e6c1672e58607dd5545923bfce6420911fd1c967ec500b08'
            '7a8507af8fd92a7acc68c34d6a7525b67e0c0419ef8a99cd620d459837c7d1e8')

package() {
	install -D -m0755 ${pkgname}-check_mk_agent.linux-${pkgver} "${pkgdir}"/usr/bin/check_mk_agent
	install -D -m0755 ${pkgname}-check_mk_caching_agent.linux-${pkgver} "${pkgdir}"/usr/bin/check_mk_caching_agent
	install -D -m0644 -t "${pkgdir}"/usr/lib/systemd/system/ check_mk.socket check_mk@.service
	install -d -m0755 "${pkgdir}"/var/lib/check_mk_agent/{cache,job,spool,local,plugins}
}
