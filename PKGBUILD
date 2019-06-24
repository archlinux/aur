# Maintainer: Nick Cao <nickcao@nichi.co>
pkgname=intang
pkgver=r20.479bebd
pkgver() {
  cd INTANG
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc='INTANG is research project for circumventing the "TCP reset attack"'
arch=('x86_64')
url='https://github.com/seclab-ucr/INTANG'
license=('GPLv3')
depends=('libnetfilter_queue'
	 'libnfnetlink'
	 'redis'
	 'hiredis'
	 'libev'
	 )
optdepends=('python-redis'
	    'python-scapy'
	   )
source=('git+https://github.com/seclab-ucr/INTANG.git'
	'intang-start'	
	'intang-stop'
	)
md5sums=('SKIP'
         '76ce07438e87b6a83b7270fe5006bdd7'
         '250a9e999242ae55ddf470c7bd174587')
build() {
	cd $srcdir/INTANG
	make
}
package() {
	install -Dm744 $srcdir/INTANG/bin/intangd $pkgdir/opt/intang/bin/intangd
	install -Dm744 $srcdir/intang-start $pkgdir/opt/intang/intang-start
	install -Dm744 $srcdir/intang-stop $pkgdir/opt/intang/intang-stop
	install -Dm644 $srcdir/INTANG/dns_blacklist $pkgdir/opt/intang/dns_blacklist
	install -Dm644 $srcdir/INTANG/redis.conf $pkgdir/opt/intang/redis.conf
}

