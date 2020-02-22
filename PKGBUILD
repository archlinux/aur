# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Contributor ("wookietreiber") <christian.krause@mailbox.org>

_gemname=bindata
pkgname=ruby-$_gemname
pkgver=2.4.5
pkgrel=1
pkgdesc="Declarative way to read and write structured binary data"
arch=('any')
url="https://github.com/dmendel/bindata"
license=('custom')
depends=('ruby')
makedepends=('ruby-rdoc' 'ruby-rake' 'git')
options=(!emptydirs)
source=("${_gemname}-${pkgver}.tar.gz"::"https://github.com/dmendel/bindata/archive/v${pkgver}.tar.gz")
sha256sums=('c18e4dfc38964570129e4338ac413fdd80209870279096ba0d2db09d2f7007bb')

build() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  gem build ${_gemname}.gemspec
}

package() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm644 README.md ChangeLog.rdoc -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
