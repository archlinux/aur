# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Jiyunatori <tori_LEAVETHISOUT_@0xc29.net>
# Contributor: mdev
# adopted by domanov <domanov_LEAVETHISOUT_@__gmail__com>

pkgname=emacs-org-mode
_srcname=org
pkgver=8.3.2
pkgrel=1
pkgdesc="Emacs Org Mode"
arch=('any')
url="http://orgmode.org/"
depends=('emacs')
license=('GPL')
install=emacs-org-mode.install
source=("http://orgmode.org/${_srcname}-${pkgver}.tar.gz")
sha256sums=('8ae811d19546f73306710f70eed8ee1a1ec9981e78b98af077fa224d5e8875b8')

build() {
  cd "${_srcname}-${pkgver}"
  make compile
}

package() {
  cd "${_srcname}-${pkgver}"
  make prefix="${pkgdir}/usr/share" install

  ## by default now we install also the contrib directory
  install -d -m755 $pkgdir/usr/share/emacs/site-lisp/org_contrib
  cp -r contrib/* $pkgdir/usr/share/emacs/site-lisp/org_contrib

  ##! proper install of info files (thanks mdev)
  ##! replace "orgmode" with "org" in the following lines if you want
  ##! to replace emacs own org's info files. You also need to change the  .install.
  install -D -m644 doc/org $pkgdir/usr/share/info/orgmode
  gzip -9 $pkgdir/usr/share/info/orgmode
  rm $pkgdir/usr/share/info/org
}
