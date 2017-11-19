# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: carlf <carlf at photocarl dot org>
# Contributor: oslik <oslik at mail dot ru>
#
# namcap warns that dependency ruby-rack is an unnecessary dependency. This is
# untrue.

pkgname=adsf
pkgver=1.3.0
pkgrel=1
pkgdesc='A tiny web server that you can launch instantly in any directory.'
arch=(any)
url='http://stoneship.org/software/adsf/'
license=(MIT)
depends=('ruby-rack<3')
makedepends=(rubygems)
provides=(ruby-adsf)
conflicts=(ruby-adsf)
options=(!emptydirs)
source=("https://rubygems.org/downloads/${pkgname}-${pkgver}.gem")
noextract=("${pkgname}-${pkgver}.gem")
sha256sums=('167319ba0d0ea06d6045d34dad0111aab56340a20273620d37c36fef05309c0c')

package() {
  # install gem
  HOME=/tmp gem install \
    --no-user-install \
    --ignore-dependencies \
    --install-dir "${pkgdir}$(ruby -rubygems -e 'puts Gem.default_dir')" \
    --bindir "${pkgdir}/usr/bin" \
    "${srcdir}/${pkgname}-${pkgver}.gem"

  # install license
  install -Dm 644 \
    "${pkgdir}"/usr/lib/ruby/gems/*/gems/"${pkgname}-${pkgver}"/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
