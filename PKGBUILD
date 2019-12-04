# Contributor: Davor Balder <dbalder@ozemail.com.au>
# Contributor: Jiyunatori <tori_LEAVETHISOUT_@0xc29.net>
# Contributor: mdev
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-org-mode
_srcname=org
pkgver=9.3
pkgrel=1
pkgdesc="Emacs Org Mode"
arch=('any')
url="http://orgmode.org/"
depends=('emacs')
optdepends=('java-runtime: For using ditaa.jar in the contrib directory'
	    'zsh: for using dir2org.zsh in the contrib directory')
license=('GPL')
install=emacs-org-mode.install
source=("http://orgmode.org/$_srcname-$pkgver.tar.gz")
sha256sums=('9d5f1e1540126793506866b23d24e4de80a96f9bdf312c89c4ede4b1c898d0c4')

build() {
  cd "$_srcname-$pkgver"
  make
}

package() {
  cd "$_srcname-$pkgver"
  make DESTDIR="$pkgdir" install

  ## by default now we install also the contrib directory
  install -d -m755 "$pkgdir"/usr/share/emacs/site-lisp/org_contrib
  cp -r contrib/* "$pkgdir"/usr/share/emacs/site-lisp/org_contrib

  ##! proper install of info files (thanks mdev)
  ##! replace "orgmode" with "org" in the following lines if you want
  ##! to replace emacs own org's info files. You also need to change the  .install.
  install -D -m644 doc/org "$pkgdir"/usr/share/info/orgmode
  gzip -9 "$pkgdir"/usr/share/info/orgmode
  rm "$pkgdir"/usr/share/info/org
}
