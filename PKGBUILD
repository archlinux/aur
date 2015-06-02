# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=sshfp
pkgver=1.2.2
pkgrel=2
pkgdesc="Generates DNS SSHFP-type records from SSH public keys from public keys from a known_hosts file or from scanning the host's sshd daemon."
arch=('i686' 'x86_64')
license=('GPL')
depends=('python2' 'python2-dnspython')
url="http://www.xelerance.com/software/sshfp/"
source=("$pkgname-$pkgver.tar.gz::https://github.com/xelerance/$pkgname/archive/${pkgver}.tar.gz")
md5sums=('3cedcc3463e72196ee2028543d03ebfc')

build() {
  cd "$srcdir"/$pkgname-$pkgver/

  # use python2 instead of python
  sed -e 's|python |python2 |g' \
      -i "$srcdir"/$pkgname-$pkgver/Makefile
}

package() {
  cd "$srcdir"/$pkgname-$pkgver/

  make DESTDIR="$pkgdir" install

  sed -e 's|^#!/usr/bin/python$|#!/usr/bin/python2|g' \
      -i "$pkgdir"/usr/bin/sshfp \
      -i "$pkgdir"/usr/bin/dane
}

# vim:set ts=2 sw=2 et:
