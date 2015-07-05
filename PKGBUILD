# Maintainer: Mark Laws <eMm Dee eLl at 60 hz dot org>
# Contributor: Ben Darwin <bcdarwin@gmail.com>

pkgname=ats2-contrib
_pkgname=ATS2-Postiats-contrib
pkgver=0.2.0
pkgrel=2
pkgdesc="Extra libraries for the ATS2 programming language"
arch=('any')
url="http://www.ats-lang.org/"
license=('GPL3')
depends=('ats2-postiats')
makedepends=('ats2-postiats')
options=('staticlibs')
source=("https://downloads.sourceforge.net/project/ats2-lang/ats2-lang/ats2-postiats-${pkgver}/${_pkgname}-${pkgver}.tgz")
sha256sums=('e2ce0d62684e06be4c23aa889cae7ea45447c36f7cdc6c3ee173e9586426ffa1')

package() {
  source /etc/profile.d/ats2-postiats.sh
  local patshome="${pkgdir%%/}/${PATSHOME}"
  local profiled="${pkgdir}/etc/profile.d"

  mkdir -p "${patshome}"
  mkdir -p "${profiled}"
  cp -a "${srcdir}/${_pkgname}-${pkgver}/." "${patshome}"

  cat <<EOF > "${profiled}/${pkgname}.sh"
source /etc/profile.d/ats2-postiats.sh
export PATSHOMERELOC=\$PATSHOME
EOF

  cat <<EOF > "${profiled}/${pkgname}.csh"
source /etc/profile.d/ats2-postiats.csh
setenv PATSHOMERELOC \$PATSHOME
EOF
}

# Local Variables:
# compile-command: "makepkg -sm"
# End:
