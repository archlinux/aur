# Maintainer: Achilleas Pipinellis <axilleas at archlinux dot gr>

_npmname=gitlab-letsencrypt
_npmver=3.1.1
pkgname=nodejs-$_npmname
pkgver=$_npmver
pkgrel=2
pkgdesc="Easily generate a Let's Encrypt certificate for GitLab.com hosted pages"
arch=('i686' 'x86_64')
url="https://github.com/rolodato/gitlab-letsencrypt"
license=('GPL3')
depends=('nodejs')
makedepends=('npm')
provides=()
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --user root --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" $_npmname@$_npmver
  chmod -R 755 $_npmdir$_npmname

  ## Remove empty dir
  rmdir "$pkgdir/usr/etc/"
}
sha256sums=('8d737f7ec01797c642a4dedde83598484e5ae7750bcc6d40d13fd05e66e6414e')
