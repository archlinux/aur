# Maintainer: Sandy Carter <bwrsandman@gmail.com>
# Contributor: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com

pkgname=polygnome-git
pkgver=0.1.3.r40.g1bc7ba3
pkgrel=1
pkgdesc="A polyrhythmic metronome"
arch=(i686 x86_64)
url="https://gitlab.com/tmatth/polygnome"
license=('GPL3')
depends=('stk' 'jack')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

source=("${pkgname%-git}::git+https://gitlab.com/tmatth/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  msg "Prevent adding -lrtaudio to ld"
  sed -i 's/-lrtaudio//g' "${srcdir}/${pkgname%-git}"/configure.ac
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  ./autogen.sh --prefix=/usr
  ./configure
	make 
}

package() {
  cd "${srcdir}/${pkgname%-git}"
	make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
