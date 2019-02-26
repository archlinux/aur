# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>
pkgname=binfmt-support
pkgver=2.2.0
_pkgver=2.2.0                      # For use with RC releases, to replace the - with _
pkgrel=2
pkgdesc="Arbitraty executable file format kernel extension"
arch=('i686' 'x86_64')
url="https://git.savannah.gnu.org/cgit/binfmt-support.git/"
license=('GPL')
depends=('autoconf' 'automake')
makedepends=('make' 'gcc' 'git' 'libpipeline')
source=("https://git.savannah.gnu.org/cgit/binfmt-support.git/snapshot/$pkgname-$_pkgver.tar.gz")
sha512sums=('b35238fa96f7e3201f7c9a70172ecd2c6b0be66e4735ff96c17ae2167f670a67c856d0fc1b0d50bf3c14f4a35c5e9927a848814791ea9be928dff82426cb0da4')

prepare() {
    echo -e '\033[0;31mWARNING : \033[1;33mThis package is deprecated, please use systemd-binfmt instead.\033[0m'
    read -p "Do you really want to install it anyway ? " yn 
    case $yn in
	[Nn]* ) exit;;
    esac
    set -e
    cd "${srcdir}/$pkgname-$_pkgver"
    ./bootstrap
}

build() {

  cd "${srcdir}/$pkgname-$_pkgver"
  ./configure --prefix=/usr \
	--libexecdir=/usr/lib \
	--sbindir=/usr/bin \
	--sysconfdir=/etc \
	--disable-upstart
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  #install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" # Couldn't find any License !
}
      
