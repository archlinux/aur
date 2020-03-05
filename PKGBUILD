# Maintainer: Yacob Zitouni <yacob.zitouni@gmail.com>
# Contributor: Michael Kapelko <kornerr@gmail.com>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Contributor: David H. Bronke <whitelynx@gmail.com>
# Contributor: Andrea Ratto <andrearatto_liste@yahoo.it>

_name=cx_Oracle
pkgname=python-cx_oracle
pkgver=7.3.0
pkgrel=3
pkgdesc="Python extension module that allows access to Oracle databases"
arch=('i686' 'x86_64')
url='https://oracle.github.io/python-cx_Oracle/'
license=('BSD')
depends=('python' 'oracle-instantclient-sdk')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2e0da54e948b55e5c75fab14b391d58aa8b9be1eddfd9ec9a8a0e500bc8bfc7e')

prepare() {
  printf "\033[1;31mWarning:\033[0m The package oracle-instantclient-basic must be installed manually "
  printf "\nunofficial prebuilt Arch packages are available by adding the"
  printf "\nfollowing lines to /etc/pacman.conf, if you agree to the Oracle licence[1]:"
  printf "\n\n[oracle]"
  printf "\nSigLevel = Optional TrustAll"
  printf '\nServer = http://linux.shikadi.net/arch/$repo/$arch/'
  printf "\n\nThen run 'pacman -Sys oracle' to see available packages."
  printf "\n[1]: http://www.oracle.com/technetwork/licenses/instant-client-lic-152016.html"
  printf "\n"
}




package() {
  cd $srcdir/cx_Oracle-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "$pkgdir"/usr/cx_Oracle-doc/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  install -Dm644 "$pkgdir"/usr/cx_Oracle-doc/README.txt "$pkgdir"/usr/share/doc/$pkgname/README.txt
  rm -rf "$pkgdir"/usr/cx_Oracle-doc
}
