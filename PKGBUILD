# Maintainer: Mark Laws <eMm Dee eLl at 60 hz dot org>
# Contributor: Ben Darwin <bcdarwin@gmail.com>

pkgname=ats2-contrib
_pkgname=ATS2-Postiats-contrib
pkgver=0.2.0
pkgrel=1
pkgdesc="Extra libraries for the ATS2 programming language"
arch=('any')
url="http://www.ats-lang.org/"
license=('GPL3')
depends=('ats2-postiats')
options=('staticlibs')
source=(
  "http://downloads.sourceforge.net/project/ats2-lang/ats2-lang/ats2-postiats-${pkgver}/$_pkgname-$pkgver.tgz")
sha256sums=('e2ce0d62684e06be4c23aa889cae7ea45447c36f7cdc6c3ee173e9586426ffa1')

package() {
  local ats2init=/etc/profile.d/ats2-postiats
  source "${ats2init}.sh"

  mkdir -p "$pkgdir/$PATSHOME"
  mv "$_pkgname-$pkgver"/* "$pkgdir/$PATSHOME"

  local profiled="$pkgdir/etc/profile.d"
  mkdir -p "$profiled"
  local scriptbase="${profiled}/${pkgname}"
  echo "source ${ats2init}.sh" > "${scriptbase}.sh"
  echo 'export PATSHOMERELOC=$PATSHOME' >> "${scriptbase}.sh"
  echo "source ${ats2init}.csh" > "${scriptbase}.csh"
  echo 'setenv PATSHOMERELOC $PATSHOME' >> "${scriptbase}.csh"

  chmod 0755 "${scriptbase}.sh" "${scriptbase}.csh"
}
