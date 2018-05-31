# Maintainer: Oliver Mangold
# Maintainer: Holger Rauch < holger dot rauch at posteo dot de>

_gemname=docbookrx
pkgname=ruby-${_gemname}
pkgver=1.0.0.dev
pkgrel=2
pkgdesc='Docbook to Asciidoc converter'
url='https://github.com/asciidoctor/docbookrx'
arch=('any')
license=('MIT')
depends=('ruby>=2.3' 'ruby-nokogiri>=1.6.7')
makedepends=('ruby-rspec>=3.4.0')
options=('!emptydirs')
source=(git+http://github.com/asciidoctor/${_gemname}.git#commit=189022a6250737e2bc6ea83ae676bf1edb35a0eb)
md5sums=(SKIP)

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    cd "${srcdir}/${_gemname}"
    gem build ${_gemname}.gemspec
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
