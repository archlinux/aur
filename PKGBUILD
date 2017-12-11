# Maintainer: Félix "passcod" Saparelli <felix @ passcod . name>
# Contributor: Alex "grevus" Lobtsov <alex@lobtsov.com>
pkgname=php-gearman
pkgver=2.0.3
pkgrel=4
pkgdesc="PHP wrapper to libgearman"
url="https://github.com/wcgallego/pecl-gearman"
arch=('x86_64' 'i686')
license=('PHP')
depends=('php' 'gearman')
backup=('etc/php/conf.d/gearman.ini')

source=("https://github.com/wcgallego/pecl-gearman/archive/gearman-${pkgver}.tar.gz")
sha512sums=('d9a390d34c54f6a922a6b21a6b8a0412cbc4986f27012d52b0e6dc55d6db502e7c097472a81c0219c0b7f8075af5baa742b4dae6971bbf3cedc9e5fc5eb93cfd')

build() {
  cd "${srcdir}/pecl-gearman-gearman-${pkgver}"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/pecl-gearman-gearman-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo 'extension=gearman.so' > gearman.ini
  install -Dm644 gearman.ini "${pkgdir}/etc/php/conf.d/gearman.ini"
}
