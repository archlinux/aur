# Maintainer:  Yan Doroshenko <yandoroshenko@protonmail.com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: ptk042 <ptk042@gmail.com>
# Contributor: mmm <markotahal@gmail.com>
# Contributor: xduugu <xduugu@gmx.com>
# Contributor: Evangelos Foutras <foutrelis@gmail.com>
# Contributor: David Fuhr <david.fuhr@web.de>
# what the heck

pkgname=oracle-sqldeveloper
pkgver=19.2.1.247.2212
pkgrel=1
pkgdesc="A graphical tool for database development"
arch=('any')
url="http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html"
license=('custom:OTN')
depends=('java-environment>=8' 'java-environment<=11' 'bash' 'perl')
optdepends=('ksh'
  'java8-openjfx: Required to run the application with JDK8'
  'java11-openjfx: Required to run the application with JDK11')
source=(manual://sqldeveloper-$pkgver-no-jre.zip
        oracle-sqldeveloper.desktop
        oracle-sqldeveloper.sh
        LICENSE
        java_home.patch)
md5sums=('ec986f454d747b742830284e6cd46fb0'
         '1d17d18e10ab85dead0770e8840273b3'
         '26c1dc933a9ab58a4245f4f351717645'
         '71a4092467209c160d0f34abbc08e049'
         'fe446201cc0d5326ecb757c384c67232')

package() {
  cd "$srcdir/sqldeveloper"

  patch -Np1 < "$srcdir/java_home.patch"
  find . \( -iname "*.exe" -o -iname "*.dll" \) -exec rm -f "{}" +
  find . -type f -exec install -Dm644 "{}" "$pkgdir/opt/oracle-sqldeveloper/{}" \;
  chmod +x "$pkgdir/opt/$pkgname/sqldeveloper.sh"

  install -Dm755 "$srcdir/$pkgname.sh"      "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/LICENSE"          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg "To run the application you need to have java8-openjfx or java11-openjfx depending on the JDK version you will be using."
  msg "You will need to set JAVA_HOME or run this package for the first time from the console to set the jdk path."
}

# vim:set ts=2 sw=2 et:
