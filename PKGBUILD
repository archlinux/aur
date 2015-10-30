# Maintainer: Jake VanderKolk <jakevanderkolk@gmail.com>
pkgname=hostsblock
pkgver=0.999.3
pkgrel=1
pkgdesc="A script and cronjob that downloads, sorts, and installs multiple ad- and malware-blocking hosts files."
arch=(any)
url="http://gaenserich.github.com/hostsblock/"
license=('GPL')
depends=(bash curl grep sed coreutils)
optdepends=('dnsmasq: helps speed up DNS resolutions'
	    'pixelserv: removes boilerplate page on blocked urls'
	    'kwakd: removes boilerplate page on blocked urls (recommended)'
	    'unzip: allows the use of zipped downloads'
	    'p7zip: allows the use of 7zipped downloads'
            'gzip: allows compression of old blockfile')
backup=('etc/hostsblock/hostsblock.conf' 'etc/hostsblock/black.list' 'etc/hostsblock/white.list' 'etc/hostsblock/hosts.head')
changelog=$pkgname.changelog
install=$pkgname.install
source=('hostsblock.sh' 'hostsblock-urlcheck.sh' 'hostsblock-common.sh' 'hostsblock.conf' 'black.list' 'white.list' 'hosts.head' 'hostsblock.service' 'hostsblock.timer')
md5sums=('c37b64ca1e12e349f33e851bd1c0d0cc'
         'befb6ba1997af9b60c22ffc1ac1b51bc'
         '5dd054e334343338b7f4e550b39fc6dc'
         'ae9e36a9c77780306fa48d10684f71fd'
         '216d5af213e0eb3690ea3c27d4cc6258'
         '3a6ea9f5b0eef002b6ca1dd57388d78a'
         '949af91b7a40582de127eb43a96f001e'
         'c42cf86eb028e30feacc828231b8c084'
         '96d43b8f9e81f85111a2ac370c8954d8')

package() {
  install -Dm744 "$srcdir"/hostsblock.sh "$pkgdir"/usr/bin/hostsblock
  install -Dm744 "$srcdir"/hostsblock-urlcheck.sh "$pkgdir"/usr/bin/hostsblock-urlcheck
  install -Dm644 "$srcdir"/hostsblock-common.sh "$pkgdir"/usr/lib/hostsblock-common.sh
  install -Dm644 "$srcdir"/hostsblock.conf "$pkgdir"/etc/hostsblock/hostsblock.conf
  install -Dm644 "$srcdir"/black.list "$pkgdir"/etc/hostsblock/black.list
  install -Dm644 "$srcdir"/white.list "$pkgdir"/etc/hostsblock/white.list
  install -Dm644 "$srcdir"/hosts.head "$pkgdir"/etc/hostsblock/hosts.head
  install -Dm644 "$srcdir"/hostsblock.service "$pkgdir"/usr/lib/systemd/system/hostsblock.service
  install -Dm644 "$srcdir"/hostsblock.timer "$pkgdir"/usr/lib/systemd/system/hostsblock.timer
}
