# Maintainer: Army
_pkgname=fbcmd
pkgname=$_pkgname-git
pkgver=20120720.190
pkgrel=1
pkgdesc="Facebook Command Line Interface"
arch=('any')
url="https://github.com/dtompkins/fbcmd"
license=('GPL')
groups=()
depends=('php')
makedepends=('git')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=$pkgname.install
source=("$_pkgname::git+git://github.com/dtompkins/fbcmd.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "$_pkgname.php" "$pkgdir/usr/lib/$_pkgname.php"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname.php" "$pkgdir/usr/bin/fbcmd"
  cp -r "facebook" "$pkgdir/usr/lib/facebook"
  install -Dm644 "readme.txt" "$pkgdir/usr/share/$pkgname/README"
}

# vim:set ts=2 sw=2 et:
