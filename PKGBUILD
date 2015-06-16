# Contributor: Matt Parnell <parwok@gmail.com>

pkgname=update-dnsomatic
pkgver=0.2.0
pkgrel=3
pkgdesc="A perl based utility that updates OpenDNS via crontab, and is simpler than inyadn"
arch=(i686 x86_64)
url="http://prawnuk.blogspot.com/2008/11/dnsomatic-updater.html"
license=('GPL')
groups=()
depends=('perl' 'perl-libwww' 'perl-crypt-ssleay' 'perl-lwp-protocol-https')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=(http://update-dnsomatic.googlecode.com/files/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('d6688165372ce1a8cc57b879713903a2')

prepare()
{
  cd "$srcdir/$pkgname-$pkgver"
  msg "You must insert your OpenDNS username and password. Opening...make sure to save."
  
  sleep 2
  
  # If you don't have either of these you really shouldn't be using linux
  if [ -x /usr/bin/vi ]
	then vi config || return 1
  else
    nano config || return 1
  fi
}

build() 
{
  return 0
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"
  
  mkdir ${pkgdir}/etc
  mkdir ${pkgdir}/etc/update-dnsomatic
  mkdir ${pkgdir}/usr/
  mkdir ${pkgdir}/usr/bin/
  
  install -m600 config ${pkgdir}/etc/update-dnsomatic/config
  install -m700 update-dnsomatic ${pkgdir}/usr/bin/update-dnsomatic

  msg "Done!...now just add it to the crontab."
  msg "Sample to update every 10 minutes: */10 * * * * /usr/local/bin/update-dnsomatic"
}
