# Maintainer Valantin <valantin89 [at] gmail [dot] com>

_gemname=activesupport
_pkgname=ruby-$_gemname
pkgver=4.2.10
pkgname=$_pkgname-$pkgver
pkgrel=1
pkgdesc='A toolkit of support libraries and Ruby core extensions extracted from the Rails framework. Rich support for multibyte strings, internationalization, time zones, and testing.'
arch=(i686 x86_64)
url='http://rubyonrails.org/'
license=(MIT)
depends=('ruby>=1.9.3'
         'ruby-i18n>0.7'
         'ruby-minitest>5.1'
         'ruby-thread_safe>=0.3.4'
         'ruby-tzinfo>1.1')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('275b14e515eb8c924bafa734417ec053a57f177ae9d3369f753d6f4437922268')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
