# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Firmicus <francois . archlinux . org>

_pkgname=texlive-localmanager
pkgname=${_pkgname}-git
pkgver=v0.4.5.r3.g8c9f9e4
pkgrel=1
pkgdesc="A shell and command-line utility to manage TeXLive on Arch Linux"
arch=('any')
url="http://wiki.archlinux.org/index.php?title=TeXLive#TeXLive_Local_Manager"
license=('GPL')
depends=('texlive-core>=2011' 'perl-libwww' 'perl-term-shellui' 'perl-term-readline-gnu' 'perl-list-moreutils' 'perl-http-message')
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
makedepends=('git')
source=("$_pkgname::git://projects.archlinux.org/users/remy/${_pkgname}.git")
md5sums=('SKIP')
install='tllocalmgr.install'

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long --tags | sed -r 's/^foo-//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/$_pkgname
  install -d $pkgdir/usr/bin
  install -d $pkgdir/var/lib/texmf/arch/tlpkg/TeXLive
  install -m755 tllocalmgr $pkgdir/usr/bin/
  cd tlpkg/TeXLive
  for _f in *; do
    install -m644 $_f $pkgdir/var/lib/texmf/arch/tlpkg/TeXLive/
  done
}
