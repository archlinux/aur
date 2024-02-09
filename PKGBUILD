# Maintainer: Jiri Pospisil <jiri@jpospisil.com>

pkgname=pkl
pkgver=0.25.2
pkgrel=1
pkgdesc='A configuration as code language with rich validation and tooling.'
arch=('x86_64')
url='https://pkl-lang.org'
license=('Apache')
conflicts=('pkl-git' 'pkl-bin')
makedepends=('jdk-openjdk' 'git')
changelog=CHANGELOG
source=("https://github.com/apple/pkl/archive/refs/tags/$pkgver.tar.gz")
b2sums=('323a0d496591367f8b530811005540fd283c6affa0358c701e5f30ae3b751b6888dcd20f01812918a2558166a26c4948f9f77770733f224e2dd79b99e2c5f4e3')

build() {
  cd "$srcdir/pkl-$pkgver"
  ./gradlew --info --stacktrace -DreleaseBuild=true pkl-cli:linuxExecutableAmd64
}

package() {
  cd "$srcdir/pkl-$pkgver"
  install -Dm755 "pkl-cli/build/executable/pkl-linux-amd64" "$pkgdir/usr/bin/pkl"
}
