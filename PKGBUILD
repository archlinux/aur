# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=robotstxt
# No released version yet, so versioned based on the number of commits.
# Zeros to preserve numbering for any future version available.
pkgver=0.0.0.31
pkgrel=1
pkgdesc="Google's robots.txt parser and matcher as a C++ library (compliant to C++11)."
arch=('x86_64')
url="https://github.com/google/robotstxt"
license=('Apache')
depends=('gcc-libs')
makedepends=('bazel')
_git_commit='bacd8ba94b6d066ff6c0eb622b46bf655490994d'
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/robotstxt/archive/$_git_commit.tar.gz")
sha256sums=('92fcc2560fa5f889ab9fde01b7fdd8e70c02a7dd7c33e9151de3d98d065c9e2f')

build() {
  cd "$srcdir/robotstxt-$_git_commit"
  bazel build :robots_main
}

package() {
  install -dm0755 "$pkgdir/usr/bin"

  install -m0755 "$srcdir/robotstxt-$_git_commit/bazel-bin/robots_main" "$pkgdir/usr/bin/robots_main"
}

check() {
  cd "$srcdir/robotstxt-$_git_commit"
  bazel test :robots_test
}
