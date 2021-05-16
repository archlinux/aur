# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor: Jonathan Steel <jsteel at archlinux.org>

pkgname=hiera
pkgver=3.7.0
pkgrel=1
pkgdesc='Lightweight pluggable hierarchical database'
arch=('any')
url="https://github.com/puppetlabs/${pkgname}"
license=('APACHE')
depends=('ruby2.7')
backup=('etc/hiera.yaml')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.puppetlabs.com/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        ruby3.patch)
sha512sums=('5c6f9068d8143c72e5d117e02c19b12c01d4ab9277241b50da9042d1fa1fe7de3fcf68a63f0f3cb6f640c37c3fd11e2888f118a837ad6aa8504d6d72c87a64a8'
            '4e55027f5c21872eb55ae80656c3039a92717d2619cbeef1a86c8d5f938727b3f9ff68bdceb71b3198597bcd5cb981a8b3b07528003364041ef387376d80d275')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 < ../ruby3.patch
}

package() {
  cd "${pkgname}-${pkgver}"
  ruby-2.7 install.rb --destdir="${pkgdir}" --sitelibdir="$(ruby-2.7 -e 'puts RbConfig::CONFIG["vendorlibdir"]')" --mandir=/
  install -d "${pkgdir}"/var/lib/hiera/
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
