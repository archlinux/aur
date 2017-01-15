# this is a copy from the community package, but with a
# configure flag to have the recollq binary in the system
#
# by Martin Kaffanke <m.kaffanke@gmail.com>
#
# $Id: PKGBUILD 181426 2016-06-27 13:36:06Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Vladimir Chizhov <jagoterr@gmail.com>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>

pkgname=recoll-with-recollq
_pkgname=recoll
pkgver=1.22.4
pkgrel=1
pkgdesc="Full text search tool based on Xapian backend - this version includes recollq"
arch=('i686' 'x86_64')
url="http://www.lesbonscomptes.com/recoll/"
license=('GPL')
depends=('xapian-core>=1.0.15-1' 'qt4' 'openssl' 'hicolor-icon-theme' 'qtwebkit')
makedepends=('python')
optdepends=('libxslt: for XML based formats (fb2,etc)'
	    'unzip: for the OpenOffice.org documents'
	    'poppler: for pdf'
	    'pstotext: for postscipt'
	    'antiword: for msword'
	    'catdoc: for ms excel and powerpoint'
	    'unrtf: for RTF'
	    'untex: for dvi support with dvips'
	    'djvulibre: for djvu'
	    'id3lib: for mp3 tags support with id3info'
	    'python2: for using some filters'
	    'mutagen: Audio metadata'
	    'python2-pychm: CHM files'
	    'perl-image-exiftool: EXIF data from raw files'
	    'aspell-en: English stemming support')
conflicts=('recoll')
source=("http://www.lesbonscomptes.com/$_pkgname/$_pkgname-${pkgver/_/}.tar.gz")
md5sums=('cf96aac590707790cb8a9a64f6ff8d7b')

prepare() {
  cd "$srcdir/$_pkgname-${pkgver/_/}"
#  export PYTHON=/usr/bin/python2
#
#  for file in rclchm rclexecm.py rclics rclpython rclzip rclaudio rclinfo rclkar \
#              rcllatinclass.py rclwar rclrar ppt-dump.py rcldia rclepub rclmpdf \
#              rcltar xls-dump.py xlsxmltocsv.py; do
#      sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' "filters/$file"
#  done
#  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' doc/user/usermanual.html
#  sed -i 's_python$_python2_' desktop/hotrecoll.py
#  sed -i 's_python _python2 _' python/recoll/Makefile recollinstall*
#
#  sed -i '1,1i#include <unistd.h>' utils/rclionice.cpp
}

build() {
  cd "$srcdir/$_pkgname-${pkgver/_/}"
  QMAKE=qmake-qt4 ./configure --prefix=/usr --mandir=/usr/share/man --enable-recollq
  make
}

package() {
  cd "$srcdir/$_pkgname-${pkgver/_/}"
  make DESTDIR="$pkgdir" install
}
