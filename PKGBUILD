# Maintainer 2016-2017: Milian Reichardt <mreichardt95@gmail.com>
# Maintainer since 2018: Christian Blechert <christian@anysrc.net>

pkgname=check_mk-agent
pkgver=1.5.0p7
pkgrel=3
pkgdesc="Agent to send information to a Check_MK server"
arch=(any)
url="https://mathias-kettner.de"
license=('GPLv2')
install=${pkgname}.install
depends=('xinetd')

source=("check_mk_agent.linux::http://git.mathias-kettner.de/git/?p=check_mk.git;a=blob_plain;f=agents/check_mk_agent.linux;h=082062f32321d03cbc3caceaab7d4131bb83b75d;hb=1110ff933a3d7ec80a64101cc77e8f3342bbc9e8"
        "check_mk_caching_agent.linux::http://git.mathias-kettner.de/git/?p=check_mk.git;a=blob_plain;f=agents/check_mk_caching_agent.linux;h=327f2fd350ca16d6b9e915ede22c35af95e661cd;hb=1110ff933a3d7ec80a64101cc77e8f3342bbc9e8"
        "xinetd.conf::http://git.mathias-kettner.de/git/?p=check_mk.git;a=blob_plain;f=agents/cfg_examples/xinetd.conf;h=e612f044c927297cb7c012e9f44f49a93b5c48a9;hb=1110ff933a3d7ec80a64101cc77e8f3342bbc9e8")

sha512sums=('dcef09aeea82ec164e766b5800dd3cdaadde9f22430cf9b076db737af1b7fb4c1773633d5f6e1d80e4eb59ec5d12a0af77d6cfcb260fc7e07db616cb113214f2'
         'cd1e9c1de50e523fc602249b052fa90470e41665bf61a87117b02733eea6d5b4c7dc1c1c8500f5d2a56a4707ac2ffd8a9d147a35b67c877436b221d88aa8b16a'
         '2a27edb4f16e2cc6e6c3523675f0f98c3bd6ff842478dbeeb0a6f6d48c0b2632bdba9ddf0215928ab6fa15c1c03d2ae5ccfef4f28b43b9cd2915e8ea47855667')

package() {
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/etc/xinetd.d/"
	mkdir -p "$pkgdir/var/lib/check_mk_agent/cache"
	mkdir -p "$pkgdir/var/lib/check_mk_agent/job"
	mkdir -p "$pkgdir/var/lib/check_mk_agent/spool"
	mkdir -p "$pkgdir/usr/lib/check_mk_agent/local"
	mkdir -p "$pkgdir/usr/lib/check_mk_agent/plugins"
	install -m744 "$srcdir/check_mk_agent.linux" "$pkgdir/usr/bin/check_mk_agent"
	install -m644 "$srcdir/xinetd.conf" "$pkgdir/etc/xinetd.d/check_mk"
	install -m744 "$srcdir/check_mk_caching_agent.linux" "$pkgdir/usr/bin/check_mk_caching_agent"
}

