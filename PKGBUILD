# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
# Note : hack from http://aur.archlinux.org/packages/splittest/PKGBUILD to support split packages in AUR
pkgname=macaon-data
pkgbase=macaon-data
true && pkgname=(macaon-fr macaon-en macaon-fr-oral)

pkgver=15
pkgrel=2
pkgdesc="Language files for the macaon Natural Language Processing tools"
arch=(any)
url="http://macaon.lif.univ-mrs.fr/"
license=('GPL')
groups=()
depends=('macaon')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=https://svn.lif.univ-mrs.fr/maca_ressources/trunk/
_svnmod=macaon

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  #./autogen.sh
  #./configure --prefix=/usr
  #make
}

package_macaon-fr() {
  cd "$srcdir/$_svnmod-build"
  install -d "$pkgdir/usr/share/macaon/fr/bin"
  install -m 0644 fr/* "$pkgdir/usr/share/macaon/fr/bin"
}

package_macaon-en() {
  cd "$srcdir/$_svnmod-build"
  install -d "$pkgdir/usr/share/macaon/en/bin"
  install -m 0644 en/* "$pkgdir/usr/share/macaon/en/bin"
}

package_macaon-fr-oral() {
  cd "$srcdir/$_svnmod-build"
  install -d "$pkgdir/usr/share/macaon/fr_oral/bin"
  install -m 0644 fr_oral/* "$pkgdir/usr/share/macaon/fr_oral/bin"
}

# vim:set ts=2 sw=2 et:
