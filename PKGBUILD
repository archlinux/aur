# Maintainer: Kohei Morita <mrtc0@ssrf.in>
pkgbase=haconiwa
pkgname=haconiwa-git
pkgver=v0.10.2
pkgrel=1
pkgdesc="MRuby on Container / A Linux container runtime using mruby DSL for configuration, control and hooks http://haconiwa.mruby.org/"
arch=('x86_64')
url="https://github.com/haconiwa/haconiwa"
license=('GPL3')
depends=('libcgroup' 'criu' 'oniguruma')
makedepends=('git')
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
