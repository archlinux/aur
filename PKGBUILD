# Maintainer 2016-2017: Milian Reichardt <mreichardt95@gmail.com>
# Maintainer since 2018: Christian Blechert <christian@anysrc.net>

pkgname=check_mk-agent
pkgver=1.5.0p2
pkgrel=2
pkgdesc="Agent to send information to a Check_MK server"
arch=(any)
url="https://mathias-kettner.de"
license=('GPLv2')
install=${pkgname}.install
depends=('xinetd')

source=("check_mk_agent.linux::http://git.mathias-kettner.de/git/?p=check_mk.git;a=blob_plain;f=agents/check_mk_agent.linux;h=124838d5c32f90ba9d3ed0f6495c91cedd5a866d;hb=b1572e7f970af0185163e5f6e0d98a41b67a87d9"
        "check_mk_caching_agent.linux::http://git.mathias-kettner.de/git/?p=check_mk.git;a=blob_plain;f=agents/check_mk_caching_agent.linux;h=327f2fd350ca16d6b9e915ede22c35af95e661cd;hb=b1572e7f970af0185163e5f6e0d98a41b67a87d9"
        "xinetd.conf::http://git.mathias-kettner.de/git/?p=check_mk.git;a=blob_plain;f=agents/cfg_examples/xinetd.conf;h=e612f044c927297cb7c012e9f44f49a93b5c48a9;hb=b1572e7f970af0185163e5f6e0d98a41b67a87d9")

md5sums=('c260f0823ce6e60442d6ffeab62d8f83'
         'f3e131661041e4129d9a169271d35fbf'
         '4a114a25ffdbf7a8bc79552041490395')

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

