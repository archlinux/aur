# Maintainer: Tim Meusel <tim@bastelfreak.de>

pkgname=hiera
pkgver=3.12.0
pkgrel=1
pkgdesc='Lightweight pluggable hierarchical database'
arch=('any')
url="https://github.com/puppetlabs/${pkgname}"
license=('APACHE')
depends=('ruby')
backup=('etc/hiera.yaml')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.puppetlabs.com/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.gemspec::https://raw.githubusercontent.com/puppetlabs/hiera/${pkgver}/.gemspec")
sha512sums=('22d9365832368d93c2003cb9ed53bddf2260ba7dbab3a5f9ef396d8c266309d35b1e40e14591e75441d97668092c24830965f5b5353637e5480f3315f7feb360'
            '4c4465c82708ba59c04cd9f9d3fd4fe100fb579f9554320ca16bd30eeb4aa30d6cb4b2aed67c9fae4473f8d07e50326b1bbffa3af3786db659f8d2763ec0adf9')

prepare() {
  cd "${pkgname}-${pkgver}"
}

package() {
  cd "${pkgname}-${pkgver}"
  ruby install.rb --destdir="${pkgdir}" --sitelibdir="$(ruby -e 'puts RbConfig::CONFIG["vendorlibdir"]')" --mandir=/
  install -vDm644 "../${pkgname}-${pkgver}.gemspec" -t "${pkgdir}/usr/lib/ruby/gems/3.0.0/specifications/"
  install -vd "${pkgdir}/var/lib/hiera/"
  install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm644 CONTRIBUTING.md README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
