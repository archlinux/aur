# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=robotstxt
# No released version yet, so versioned based on the number of commits.
# Zeros to preserve numbering for any future version available.
pkgver=0.0.0.68
pkgrel=1
pkgdesc="Google's robots.txt parser and matcher as a C++ library (compliant to C++11)."
arch=('x86_64')
url="https://github.com/google/robotstxt"
license=('Apache')
depends=('gcc-libs')
makedepends=('bazel')
_git_commit='3677dc912c56d14df2126a125583e3763e5799e8'
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/robotstxt/archive/$_git_commit.tar.gz")
sha256sums=('07ecf3bf54828fc94666325d593a81a2454a61f333e45cfa77e02393e466120d')

build() {
  cd "$srcdir/robotstxt-$_git_commit"
  bazel build :robots_main
}

package() {
  install -dm0755 "$pkgdir/usr/bin"

  install -m0755 "$srcdir/robotstxt-$_git_commit/bazel-bin/robots_main" "$pkgdir/usr/bin/robotstxt"
}

check() {
  cd "$srcdir/robotstxt-$_git_commit"
  bazel test :robots_test
}
