# Mainained by imper <imperator999mcpe@gmail.com>
pkgname="privacy-protection-messenger"
pkgver=1.2
pkgrel=1
pkgdesc="Secure messenger backend"
author="imperzer0"
branch="master"
url="https://github.com/$author/$pkgname"
arch=('x86_64')
license=('GPL3')
depends=("openssl" "iptables-nft" "themispp>=0.14.1" "mariadb")
makedepends=("cmake>=3.0" "inet-comm>=3.6-0" "openssl" "themispp" "mariadb" "mariadb-connector-cpp-git")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

_srcprefix="https://raw.githubusercontent.com/$author/$pkgname/$branch"
_libfiles=("CMakeLists.txt" "main.cpp" "color.hpp" "network.hpp" "$pkgname.service")

for _libfile in ${_libfiles[@]}
{
    source=(${source[@]} "$_srcprefix/$_libfile")
}

md5sums=('22e1b421db28f59f6827e4179ab39541'
         'a3b00d0b47d875eb4c00c1468cd36fd2'
         '058646ab78672c97a2f18dffc1b56ebf'
         '4b700bff185758024c5aeb0054b0e010'
         'cc8e63452b809611b046e7f27934c12e')

_package_version=$pkgname" ("$pkgver"-"$pkgrel")"
_var_directory="/var/lib/$pkgname"

build()
{
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DPACKAGE_VERSION="$_package_version" -DVAR_DIRECTORY=$_var_directory .
	make
}

package()
{
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 $pkgname.service "$pkgdir/etc/systemd/system/$pkgname.service"
	mkdir -pm644 $pkgdir$_var_directory
}