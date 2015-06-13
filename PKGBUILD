# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=shellsql
pkgver=0.7.7
pkgrel=1
pkgdesc="ShellSQL is a suite of programs designed to enable LINUX/UNIX shell scripts to connect to SQL engines and execute SQL queries and commands in a simple way enabling intergration with the rest of the script, support DB: postgres, mysql, sqlite3 and odbc"
url="http://shellsql.sourceforge.net"
license=('GPL')
arch=('i686' 'x86_64')
depends=('glibc' 'gcc')
optdepends=('postgresql' 'mysql' 'sqlite3')
source=(http://sourceforge.net/projects/shellsql/files/shellsql/$pkgver/shellsql-$pkgver.tgz/download)
md5sums=('5b9e714048aa892d312408f401b5bc62')

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed "s_"BINDIR=/usr/bin"_"BINDIR=$startdir/pkg/usr/bin"_g" < install.sh > install2.sh
  chmod +x install2.sh
  mkdir -p $startdir/pkg/usr/bin
  
  #PATCH: fix conflicting declaration for getline in shsqlinp
  cd src/
  sed "s_"getline"_"getLine"_g" < shsqlinp.c > shsqlinp.c2
  mv shsqlinp.c2 shsqlinp.c
  cd ..
  
  ./install2.sh postgres mysql sqlite3 odbc tools || return 1
}
