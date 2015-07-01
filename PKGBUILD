
# Contributor: aleksonik imsnet@yandex.ru

pkgname=hzs_reminder
pkgver=2012.9.30
pkgrel=2
pkgdesc="Birthday Reminder"
arch=('i686' 'x86_64')
url="https://sourceforge.net/p/hzsreminder/wiki/Home/"
license=('GPL')
depends=(qt4)
source=("http://downloads.sourceforge.net/project/hzsreminder/2012-09-30/hzs_reminder_source.tar.gz" reminder.qrc)

md5sums=('eca7764677674c63378248d8dab2ae3c'
'44dba43700114f5eae700ad855aa19ef')


build() {
echo "Building ..."

cd "$srcdir"
mv ./hzs_reminder_source/reminder.qrc ./hzs_reminder_source/reminder.qrc__
cp ./reminder.qrc ./hzs_reminder_source/reminder.qrc

cd "$srcdir"/hzs_reminder_source

qmake-qt4  QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS"
make || return 1
}


package() {
install -D -m755 $srcdir/hzs_reminder_source/reminder $pkgdir/usr/bin/reminder
}
