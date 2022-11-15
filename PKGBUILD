# Maintainer: DoctorZeus(Dan) <contact@techtonicsoftware.com>
# Contributor: Gabriel Morrison Lima Dantas <gabrielmldantas@gmail.com>
# Contributor: Aleksey Kamenskikh <aleksey.kamenskikh@gmail.com>
pkgname=mssql-server
pkgver=15.0.4261.1
_remRevision=2
_prodver=${pkgver}-${_remRevision}
pkgrel=4
pkgdesc="Microsoft SQL Server for Linux"
arch=('x86_64')
url="https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-overview?view=sql-server-ver15"
license=('unknown')
depends=(
	'libatomic_ops'
	'libunwind'
	'numactl' 
	'glibc'
	'libc++'
	'gdb'
	'openssl-1.1'
	'krb5'
	'nss'
	'sssd'
	'gawk'
	'sed'
	'pam'
	'libldap<=2.4.59'
);
optdepends=(
	'python-pyodbc'
);
source=("https://packages.microsoft.com/rhel/7/mssql-server-2019/${pkgname}-${_prodver}.x86_64.rpm")

sha256sums=('db9a757b85b218c2c091d716c2ece28e5c0c9aee713eadc61827393b2c1d51b8')

install=$pkgname.install

package() {

	#Setup
	cd $pkgdir
	mv $srcdir/opt .
	mv $srcdir/usr .

	#Create links to non-breaking libssl and libcrypto libs
	ln -sf /lib/libssl.so.1.1 $pkgdir/opt/mssql/lib/libssl.so
	ln -sf /lib/libcrypto.so.1.1 $pkgdir/opt/mssql/lib/libcrypto.so

	#Set systemd service file perms
	chmod 644 $pkgdir/usr/lib/systemd/system/mssql-server.service
}
