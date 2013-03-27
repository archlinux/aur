# Contributor: mutantmonkey <aur@mutantmonkey.in>
pkgname=crunchyfrog-hg
pkgver=722
pkgrel=2
pkgdesc="SQL editor and database schema browser for the GNOME desktop, latest development version"
url='http://code.google.com/p/crunchyfrog'
arch=('any')
license=('GPL3')
depends=('python' 'python2-configobj' 'pygtk' 'pygtksourceview2' 'pycairo'
         'pyxdg' 'gnome-python' 'gnome-python-desktop'
         'python-sphinx' 'python-sqlparse')
optdepends=('mysql-python:  To handle MySQL Databases',
            'python-psycopg2:   To handle PostgreSQL Databases',
            'python-pysqlite:   To handle SQLite Databases',
            'cx_oracle: To handle Oracle Databases (just for i686)',
            'pymssql:   To handle Microsoft SQL Server Databases',
            'kinterbasdb:   To handle Firebird Databases'
            'informixdb: To handle Informix Databases'
            'sapdb: To handle MaxDB'
            'ipython: To use built-in python shell'
           )
makedepends=('mercurial')
provides=('crunchyfrog')
conflicts=('crunchyfrog')
source=()
md5sums=()
sha256sums=()

_hgroot="https://crunchyfrog.googlecode.com/hg"
_hgrepo="crunchyfrog"

build() {
  cd ${srcdir}/${_hgrepo}
  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
  make PYTHON=/usr/bin/python2
}

package() {
  cd ${srcdir}/${_hgrepo}
  make install PYTHON=/usr/bin/python2 DESTDIR=${pkgdir}/ 
}

# vim:set ts=2 sw=2 et:
