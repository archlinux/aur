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

pkgname=apache-mod_macro
_pkgname=mod_macro
pkgver=1.2.1
pkgrel=1
pkgdesc="DSO module for Apache that allows the definition and use of macros within apache runtime configuration files. "
url="https://www.cri.ensmp.fr/~coelho/mod_macro/"
arch=('i686' 'x86_64')
license=('apache')
depends=('apache')
makedepends=('apache')
install="$pkgname.install"
source=("https://www.cri.ensmp.fr/~coelho/mod_macro/$_pkgname-$pkgver.tar.gz")
md5sums=('d57f45c146a47818fb1ad346c2e4ce68')

_MODDIR='usr/lib/httpd/modules'
_DOCDIR="usr/share/doc/$pkgname"

build() {
  cd $srcdir/$_pkgname-$pkgver

  # make the module
  /usr/sbin/apxs -c -o $_pkgname.so $_pkgname.c
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  install -Dm444 .libs/$_pkgname.so $pkgdir/$_MODDIR/$_pkgname.so

  # install docs
  install -Dm444 $_pkgname.html $pkgdir/$_DOCDIR/$_pkgname.html
}

# vim:set ts=2 sw=2 et:
