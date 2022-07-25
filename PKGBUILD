# Maintainer: Tommy Jerry Mairo <recreation@tjm.moe>
pkgname=webshells-git
pkgver=1.1
pkgrel=1
pkgdesc="A collection of webshells for ASP, ASPX, CFM, JSP, Perl, and PHP servers."
arch=("any")
url="https://www.kali.org/tools/webshells/"
license=('GPL')
makedepends=('git')

_gitroot=https://gitlab.com/kalilinux/packages/webshells.git
_gitname=webshells

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  rm -rf "$srcdir/$_gitname-build/debian"

}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p "$pkgdir/usr/share/webshells"
  cp -ar * "$pkgdir/usr/share/webshells/"
}

# vim:set ts=2 sw=2 et:
