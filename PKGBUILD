# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: FadeMind <fademind@gmail.com>

_altname=yakuake-breeze_perfect_dark
pkgname=yakuake-skin-breeze-perfect-dark
pkgver=2.0.r10.gbf263e2
pkgrel=2
pkgdesc='The perfect Breeze Dark theme for Yakuake'
arch=('any')
url='https://github.com/noahadvs/yakuake-breeze_perfect_dark'
license=('GPL2')
makedepends=('git')
depends=('yakuake')
source=("git+${url}#commit=bf263e2c2d2e8061d82846b9029b023884458a84")
md5sums=('SKIP')

pkgver() {
  cd "$_altname"
  ( set -o pipefail
    git describe --long --tags --first-parent --match 'v[0-9][0-9.][0-9.]*' | \
      sed 's=^v==;s=^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)=\1\2=;s=\([0-9]\+-g\)=r\1=;s=-=.=g'
  )
}

prepare() {
  rm -rf "$_altname/customizations" # not needed for final package
}

package() {
  cd "$_altname"

  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/yakuake/skins/{}" \;
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
