# Maintainer: Tim Meusel <tim@bastelfreak.de>

pkgname=hiera
pkgver=3.12.0
pkgrel=3
pkgdesc='Lightweight pluggable hierarchical database'
arch=('any')
url="https://github.com/puppetlabs/${pkgname}"
license=('APACHE')
depends=('ruby')
backup=('etc/hiera.yaml')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.puppetlabs.com/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.gemspec::https://raw.githubusercontent.com/puppetlabs/hiera/${pkgver}/.gemspec")
sha512sums=('812e2ca81fde72b46c722cef9e4ce96c4c223a2bc013c383214e6098850e858f466999e65b1c7e06de1d2b2ea96d5e757fe31e9fbcc10cd645ba7de2149008e9'
            '4c4465c82708ba59c04cd9f9d3fd4fe100fb579f9554320ca16bd30eeb4aa30d6cb4b2aed67c9fae4473f8d07e50326b1bbffa3af3786db659f8d2763ec0adf9')

package() {
  cd "${pkgname}-${pkgver}"
  ruby install.rb --destdir="${pkgdir}" --sitelibdir="$(ruby -e 'puts RbConfig::CONFIG["vendorlibdir"]')" --mandir=/
  install -vDm644 "../${pkgname}-${pkgver}.gemspec" -t "${pkgdir}$(gem env gemdir)/specifications/"
  install -vd "${pkgdir}/var/lib/hiera/"
  install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm644 CONTRIBUTING.md README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
