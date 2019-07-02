# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=robotstxt
# No released version yet, so versioned based on the number of commits.
# Zeros to preserve numbering for any future version available.
pkgver=0.0.0.7
pkgrel=1
pkgdesc="Google's robots.txt parser and matcher as a C++ library (compliant to C++11)."
arch=('x86_64')
url="https://github.com/google/robotstxt"
license=('Apache')
depends=('gcc-libs')
makedepends=('bazel')
_git_commit='59f3643d3a3ac88f613326dd4dfc8c9b9a545e45'
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/robotstxt/archive/$_git_commit.tar.gz")
sha256sums=('ecee5d08e73d1e4afc888ce0ba77541bf8b00a14407ca473ecf8229f6cd80033')

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
