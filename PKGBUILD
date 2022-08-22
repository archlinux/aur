# Maintainer:  Devin J. Pohly <djpohly+arch@gmail.com>
# Contributor: Olivier Brunel <jjk at jjacky.com>
# Contributor: Lukas Braun <koomi+aur at hackerspace-bamberg dot de>
# Contributor: David Arroyo <droyo@aqwari.us>
# Contributor: Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=execline-musl
_pkgname=${pkgname%-musl}
pkgver=2.9.0.1
pkgrel=2
pkgdesc='A (non-interactive) scripting language, like sh'
arch=('i686' 'x86_64')
url="http://skarnet.org/software/${_pkgname}"
license=('ISC')
makedepends=('skalibs-musl>=2.12.0.0' 'musl')
provides=('execline')
conflicts=('execline')
options=('staticlibs')
source=("${url}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('01260fcaf80ffbca2a94aa55ea474dfb9e39b3033b55c8af88126791879531f6')

build() {
  cd "${_pkgname}-${pkgver}"

  export CPPFLAGS='-nostdinc -isystem /usr/lib/musl/include -isystem /usr/include'
  export CC="musl-gcc"
  ./configure --enable-static-libc --prefix=/usr --libdir=/usr/lib/execline
  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
