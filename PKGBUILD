# Maintainer: Jiri Pospisil <jiri@jpospisil.com>

pkgname=pkl
pkgver=0.25.1
pkgrel=1
pkgdesc='A configuration as code language with rich validation and tooling.'
arch=('x86_64')
url='https://pkl-lang.org'
license=('Apache')
conflicts=('pkl-git' 'pkl-bin')
makedepends=('jdk-openjdk' 'git')
changelog=CHANGELOG
source=("https://github.com/apple/pkl/archive/refs/tags/$pkgver.tar.gz")
b2sums=('748557523a795daeb86644df6acc0a0d29adb8d555a030ae796a14c6a6023bcd52417e366c09a2371fcd9af29bc2bd57b701d55035f18be5f035e841f40fcba7')

build() {
  cd "$srcdir/pkl-$pkgver"
  ./gradlew --info --stacktrace -DreleaseBuild=true pkl-cli:linuxExecutableAmd64
}

package() {
  cd "$srcdir/pkl-$pkgver"
  install -Dm755 "pkl-cli/build/executable/pkl-linux-amd64" "$pkgdir/usr/bin/pkl"
}
