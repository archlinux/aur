# Maintainer: Agatha Isabelle Moreira <code at agatha period dev>

# CREDITS: The authors/maintainers/contributors of the package autoconf2.13,
# from where I forked this package below:
# Jan de Groot <jgc@archlinux.org
# Chaiwat Suttipongsakul <cwt at bashell dot com>
# Tanguy Bouzéloc <the.zauron at gmail dot com>
# Devin Cofer <ranguvar{AT]archlinux[DOT}us>

pkgname=autoconf-gcc-contrib
pkgver=2.69
pkgrel=1
pkgdesc="A GNU tool for automatically configuring source code (version for gcc contributors)"
arch=('x86_64')
url="https://www.gnu.org/software/autoconf/"
license=('GPL2')
depends=('perl' 'm4')
makedepends=('gcc' 'binutils' 'autoconf' 'make')
source=(https://ftp.gnu.org/gnu/autoconf/autoconf-${pkgver}.tar.xz)
sha256sums=('64ebcec9f8ac5b2487125a86a7760d2591ac9e1d3dbd59489633f9de62a57684')
prefix="/opt/gcc-contrib-tools"

build() {
  cd "${srcdir}/autoconf-${pkgver}"
  ./configure --prefix="${prefix}" --infodir="${prefix}/info" \
	  --program-suffix='-'"${pkgver}"
  make
}

package() {
  cd "${srcdir}/autoconf-${pkgver}"
  make prefix="${pkgdir}/${prefix}" infodir="${pkgdir}/${prefix}/info" \
	install
  mv "${pkgdir}/${prefix}"/info/autoconf{,-2.69}.info
  mv "${pkgdir}/${prefix}"/info/standards{,-2.69}.info
}
