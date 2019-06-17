# Maintainer: Kohei Morita <mrtc0@ssrf.in>
pkgname=haconiwa-git
pkgver=v0.10.2.r15.g375a79b
pkgrel=1
pkgdesc="MRuby on Container / A Linux container runtime using mruby DSL for configuration, control and hooks http://haconiwa.mruby.org/"
arch=('x86_64')
url="https://github.com/haconiwa/haconiwa"
license=('GPL')
depends=('libcgroup' 'criu' 'oniguruma')
makedepends=('git' 'libcgroup' 'criu' 'oniguruma')
conflicts=("${pkgname%-git}")
source=('haconiwa-git::git+https://github.com/haconiwa/haconiwa')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname}"
  make
}

package() {
	cd "$srcdir/${pkgname}"
  make PREFIX="${pkgdir}/usr/" install
}
