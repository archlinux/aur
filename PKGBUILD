# Maintainer:  Michael Gisbers <michael@gisbers.de>
# Contributor: Dennis Craven <dcraven @ gmail . com>

pkgname=email
pkgver=3.1.3
pkgrel=2
pkgdesc="A simple command line client for SMTP"
arch=('i686' 'x86_64')
url="http://www.cleancode.org/projects/email/"
license=('GPL')
depends=('openssl')
backup=(etc/email/{email.{address.template,conf,help,sig},mime.types})
# the email-3.1.4.tar.gz source archive contains an email-3.1.3 directory
# configure.in also declares AC_INIT(email, 3.1.3, <deanjones@cleancode.org>)
# we will assume the real version is 3.1.3 despite the source archive name
# we will bump the pkgrel to 2 but leave the pkgver as 3.1.3 given the above
# source=(http://www.cleancode.org/downloads/email/email-$pkgver.tar.gz)
source=(http://www.cleancode.org/downloads/email/email-3.1.4.tar.gz)
md5sums=('b9d5d201bef581d601d73a524373db60')

build() {
  cd "$srcdir/email-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/email-$pkgver"
  make DESTDIR="$pkgdir" install
}
