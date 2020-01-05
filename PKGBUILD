# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=hiera
pkgver=3.6.0
pkgrel=1
pkgdesc="Lightweight pluggable hierarchical database"
arch=('any')
url="https://github.com/puppetlabs/hiera"
license=('APACHE')
depends=('ruby')
backup=('etc/hiera.yaml')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.puppetlabs.com/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e9819d0b166acca73321b6b6c23c404f2b03203d6fa934859918d47ec4ca6d234acff0c9f02012f756f239a719c00be4b48afb5b34b88069be2e67055a8f48e3')

package() {
  cd "${pkgname}-${pkgver}"
  ruby install.rb --destdir="${pkgdir}" --sitelibdir="$(ruby -e \
    'puts RbConfig::CONFIG["vendorlibdir"]')" --mandir=/
  install -d "${pkgdir}"/var/lib/hiera/
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
