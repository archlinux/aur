# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=crunchyfrog-hg
_hgname=crunchyfrog
pkgver=722.1648adf08bb3
pkgrel=2
pkgdesc="SQL editor and database schema browser for the GNOME desktop, latest development version"
url='http://code.google.com/p/crunchyfrog'
arch=('any')
license=('GPL3')
depends=('python2' 'pygtk' 'pygtksourceview2' 'gnome-python'
         'gnome-python-desktop' 'python2-configobj' 'python2-cairo'
         'python2-xdg' 'python2-sphinx' 'python2-sqlparse')
optdepends=('mysql-python:      To handle MySQL Databases',
            'python2-psycopg2:  To handle PostgreSQL Databases',
            'python2-pysqlite:  To handle SQLite Databases',
            'python2-cx_oracle: To handle Oracle Databases (just for i686)',
            'kinterbasdb:       To handle Firebird Databases'
            'informixdb:        To handle Informix Databases'
            'sapdb:             To handle MaxDB'
            'ipython2:          To use built-in python shell'
           )
makedepends=('mercurial')
provides=('crunchyfrog')
conflicts=('crunchyfrog')
source=('hg+https://code.google.com/p/crunchyfrog')
sha256sums=('SKIP')

pkgver() {
  cd $_hgname
  echo $(hg identify -n).$(hg identify -i)
}

prepare() {
  cd $_hgname
  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
}

build() {
  cd $_hgname
  make PYTHON=/usr/bin/python2
}

package() {
  cd $_hgname
  make install PYTHON=/usr/bin/python2 DESTDIR=${pkgdir}/ 
}

# vim:set ts=2 sw=2 et:
