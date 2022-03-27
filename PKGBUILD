pkgname=rtile-git
pkgver=dbb531b
pkgrel=4
pkgdesc="Ruby script for manual tiling and window placement."
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/xhsdf/rtile"
license=('GPL')
depends=('ruby' 'ruby-rexml' 'xorg-xprop' 'wmctrl' 'xorg-xrandr' 'pxdo')
makedepends=('git')
conflicts=('rtile')
provides=('rtile')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=("$pkgname"::'git+https://github.com/xhsdf/rtile.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --always --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "rtile.rb" "$pkgdir/usr/bin/rtile"
}
