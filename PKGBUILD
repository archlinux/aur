# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Mike Lenzen <lenzenmi@gmail.com>
pkgname=cpulimit-git
pkgver=92.49d7c69
pkgrel=2
pkgdesc="Limit cpu usage in %. Actualy sends SIGSTOP/SIGCONT"
arch=('i686' 'x86_64')
url="https://github.com/opsengine/cpulimit"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('cpulimit')
conflicts=('cpulimit')
source=("$pkgname::git+git://github.com/opsengine/cpulimit.git")

md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  make
}

package() {
  install -D -m0755 $srcdir/$pkgname/src/cpulimit $pkgdir/usr/bin/cpulimit
}
