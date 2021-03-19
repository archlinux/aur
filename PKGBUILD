# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=hiera
pkgver=3.6.0
pkgrel=2
pkgdesc="Lightweight pluggable hierarchical database"
arch=('any')
url="https://github.com/puppetlabs/hiera"
license=('APACHE')
depends=('ruby')
backup=('etc/hiera.yaml')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.puppetlabs.com/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        ruby3.patch)
sha512sums=('e9819d0b166acca73321b6b6c23c404f2b03203d6fa934859918d47ec4ca6d234acff0c9f02012f756f239a719c00be4b48afb5b34b88069be2e67055a8f48e3'
            '4e55027f5c21872eb55ae80656c3039a92717d2619cbeef1a86c8d5f938727b3f9ff68bdceb71b3198597bcd5cb981a8b3b07528003364041ef387376d80d275')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 < ../ruby3.patch
}

package() {
  cd "${pkgname}-${pkgver}"
  ruby install.rb --destdir="${pkgdir}" --sitelibdir="$(ruby -e \
    'puts RbConfig::CONFIG["vendorlibdir"]')" --mandir=/
  install -d "${pkgdir}"/var/lib/hiera/
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
