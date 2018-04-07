# Maintainer: Ankit R Gadiya <arch@argp.in>
# Contributor: John W. Trengrove <john@retrofilter.com>

pkgname=stagit-git
pkgver=0.8.r0.g66e3410
pkgrel=2
pkgdesc="static git page generator (Git Version)"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://git.codemadness.org/stagit"
license=('custom:MIT/X Consortium')
source=("stagit-git::git://git.codemadness.org/stagit")
depends=('libgit2')
makedepends=('git')
conflicts=('stagit')
provides=('stagit')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
