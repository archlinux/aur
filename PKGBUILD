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

pkgname=apache-mod_bw
_pkgname=mod_bw
pkgver=0.92
pkgrel=1
pkgdesc="DSO module for Apache that throttles HTTP traffic"
url="http://ivn.cl/category/apache/"
arch=('i686' 'x86_64')
license=('apache')
depends=('apache')
makedepends=('apache')
install="$pkgname.install"
source=("http://ivn.cl/files/source/$_pkgname-$pkgver.tgz"
        'apache24.patch')
md5sums=('90f5e632dad5de8d49dcdb61453dcf97'
         '23f29e631f65ba05e650a5b0cf57dba7')

_MODDIR='usr/lib/httpd/modules'
_DOCDIR="usr/share/doc/$pkgname"

prepare() {
  cd "$srcdir"

  # fix for apache 2.4
  patch < "$srcdir"/apache24.patch
}

build() {
  cd "$srcdir"

  # make the module
  /usr/sbin/apxs -c -o $_pkgname.so $_pkgname.c
}

package() {
  cd "$srcdir"

  install -Dm644 .libs/$_pkgname.so $pkgdir/$_MODDIR/$_pkgname.so

  # install docs
  install -Dm644 $_pkgname.txt $pkgdir/$_DOCDIR/$_pkgname.txt
}

# vim:set ts=2 sw=2 et:
