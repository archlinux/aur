pkgname=fahclient
pkgver=7.4.4
_shortver=7.4
_fullver=7.4.4-1
pkgrel=1
pkgdesc='A command line client for Folding@Home'
url="http://folding.stanford.edu/English/HomePage"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('zlib')
source=('fahclient.install'
	   	  'fahclient.syusers'
		    'fahclient.service'
	    	'fahclient.cfg')
install=fahclient.install
backup=(etc/fahclient.cfg)

md5sums=('9e9593148e4db224abf83feb872ff404'
         '3ed48a38bd0193ce290aa3ea25062087'
         'ad32c0a782d7a7a3de9b250468d8769f'
         'ff5a4e59e92ceb98954f4c4fdf7bad39')


if [[ $CARCH == 'i686' ]]; then
  source+=("https://folding.stanford.edu/releases/public/release/$pkgname/centos-5.5-32bit/v${_shortver}/$pkgname-${_fullver}.i686.rpm")
  md5sums+=('a5d93e866733ed6cf10e5be72f8ef016')
else
  source+=("https://folding.stanford.edu/releases/public/release/$pkgname/centos-5.3-64bit/v${_shortver}/$pkgname-${_fullver}.x86_64.rpm")
  md5sums+=('79f8676ab46bf391ecc0e9cd54aebab5')
fi


package() 
{
  install -Dm755 "$srcdir/usr/bin/FAHClient" "$pkgdir/usr/bin/FAHClient"
  install -Dm755 "$srcdir/usr/bin/FAHCoreWrapper" "$pkgdir/usr/bin/FAHCoreWrapper"
  install -Dm644 "$srcdir/fahclient.service" "$pkgdir/usr/lib/systemd/system/fahclient.service" 
  install -Dm644 "$srcdir/fahclient.syusers" "$pkgdir/usr/lib/sysusers.d/fahclient.conf"
  install -Dm644 "$srcdir/fahclient.cfg" "$pkgdir/etc/fahclient.cfg"
}