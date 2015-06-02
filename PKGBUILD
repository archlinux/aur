# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
# Contributor: Paolo Stivanin aka Polslinux <admin AT polslinux DOT it>
# pkgrel3 patcher: Ivan de Jesús Pompa García <ivan.pompa@gmx.com>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=cryptkeeper
pkgver=0.9.5
pkgrel=5
pkgdesc="A Linux system tray applet that manages EncFS encrypted folders."
arch=(i686 x86_64)
url="http://tom.noflag.org.uk/cryptkeeper.html"
license=('GPL3')
depends=('gtk2' 'gconf' 'encfs')
makedepends=('autoconf')
source=("http://tom.noflag.org.uk/$pkgname/$pkgname-$pkgver.tar.gz"
        "cryptkeeper.desktop"
        "cryptkeeper-0.9.5-fix-linking.patch"
        "cryptkeeper-0.9.5-add-unistd-to-lsof.patch")
md5sums=('d02918b2058854177d2f59b837c2743f'
         '37484e52a1557a18c0cc2443b3104007'
         'aa864cea6a81ef8e8cb3efa5ef2b9541'
         '2e21a1e82942213108774d768e12e4ee')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -Np1 < "$srcdir"/cryptkeeper-0.9.5-fix-linking.patch
  patch -Np1 < "$srcdir"/cryptkeeper-0.9.5-add-unistd-to-lsof.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -D -m644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/${pkgname}.desktop
}

# vim:set ts=2 sw=2 et:
