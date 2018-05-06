# Contributor: Davor Balder <dbalder@ozemail.com.au>
# Contributor: Jiyunatori <tori_LEAVETHISOUT_@0xc29.net>
# Contributor: mdev
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-org-mode
_srcname=org
pkgver=9.1.13
pkgrel=1
pkgdesc="Emacs Org Mode"
arch=('any')
url="http://orgmode.org/"
depends=('emacs')
license=('GPL')
install=emacs-org-mode.install
source=("http://orgmode.org/$_srcname-$pkgver.tar.gz")
sha256sums=('1a7b24a633461df967e424e21e735f3492e46abc5283ac1e2a7c998981a072d5')

build() {
  cd "$_srcname-$pkgver"
  make
}

package() {
  cd "$_srcname-$pkgver"
  make prefix="$pkgdir"/usr/share install

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
