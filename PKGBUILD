# Maintainer: Phillip Smith <pkgbuild@phs.id.au>
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

pkgname=yasat
pkgver=848
pkgrel=1
pkgdesc="A simple stupid audit tool"
arch=('any')
license=('GPL3')
depends=('sed' 'grep' 'coreutils')
backup=('etc/yasat/yasat.conf')
url="http://yasat.sourceforge.net/"
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        'yasat.conf')
md5sums=('6afa329039c145abe4dffd0fde2aeac0'
         'f4d5f19153febd51680a3895e769abdf')

package() {
	cd "$srcdir"/$pkgname

	install -Dm755 yasat "$pkgdir"/usr/bin/yasat

	install -dm755 "$pkgdir"/usr/share/yasat/

  # plugins
  cp -R plugins/ "$pkgdir"/usr/share/yasat/
  chmod 755 "$pkgdir"/usr/share/yasat/plugins
  chmod 644 "$pkgdir"/usr/share/yasat/plugins/*       # force 644 on everything, then...
  chmod 755 "$pkgdir"/usr/share/yasat/plugins/*.test  # add execute to *.test

  # common
	install -Dm644 yasat.css "$pkgdir"/usr/share/yasat/
  install -m644 common "$pkgdir"/usr/share/yasat/common
	install -m644 osdetection "$pkgdir"/usr/share/yasat/osdetection

  # default/sample config file
  install -Dm755 "$srcdir"/yasat.conf "$pkgdir"/etc/yasat/yasat.conf

  # man pages
	install -Dm644 man/yasat.8 "$pkgdir"/usr/share/man/man8/yasat.8

  # the script attempts to build this file dynamically at run time.
  # this means this file needs loose permissions if you want to run
  # yasat as a non-root user.
  touch "$pkgdir"/usr/share/yasat/yasat.advices
  chmod 666 "$pkgdir"/usr/share/yasat/yasat.advices
}

# vim:set ts=2 sw=2 et:
