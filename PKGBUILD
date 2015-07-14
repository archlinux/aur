# Maintainer: Mario Rodas <marsam@users.noreply.github.com>

pkgname=ats2-postiats
_pkgname=ATS2-Postiats
pkgver=0.2.1
pkgrel=1
pkgdesc="Statically typed programming language"
arch=('i686' 'x86_64')
url="http://www.ats-lang.org/"
license=('GPL3')
depends=('bash' 'gmp')
optdepends=('gmp')
options=('staticlibs' '!emptydirs')
source=("http://downloads.sourceforge.net/project/ats2-lang/ats2-lang/ats2-postiats-${pkgver}/${_pkgname}-${pkgver}.tgz")
sha256sums=('0a0d3a7e762a7a7ae77e5d3e27ccdc43766d19316579bfa2015a9f7977e86f7b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  local profiled="${pkgdir}/etc/profile.d"
  local patshome="/usr/lib/${pkgname}-${pkgver}"
  mkdir -p "${profiled}"

  echo "export PATSHOME=${patshome}" > "${profiled}/${pkgname}.sh"
  echo "setenv PATSHOME ${patshome}" > "${profiled}/${pkgname}.csh"

  chmod 0755 "${profiled}/${pkgname}.sh" "${profiled}/${pkgname}.csh"
}

# Local Variables:
# compile-command: "makepkg -sm"
# End:
