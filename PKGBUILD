# Maintainer: Joseph Simone <averagejoey2000 tfwno . gf>
pkgname=mccgdi
pkgver="2.0.9"
pkgrel=2
pkgdesc="PPD files for Panasonic Printers"
arch=('x86_64' 'i686')
url="panasonic.com"
license=('custom')
depends=(cups)
source_x86_64=(http://cs.psn-web.net/support/fax/common/file/Linux_PrnDriver/Driver_Install_files/$pkgname-$pkgver-x86_64.tar.gz)
source_i686=(http://cs.psn-web.net/support/fax/common/file/Linux_PrnDriver/Driver_Install_files/$pkgname-$pkgver-i686.tar.gz)
noextract=()
md5sums_x86_64=('7450b0c6224d56c6dcb2bd28e59dfbc6')
md5sums_i686=('ca182a0fb45c287951cfae0934c08ecb')
package(){
cd $srcdir/$pkgname-$pkgver-$arch/
mkdir -p $pkgdir/usr/share/licenses/$pkgname
mkdir $pkgdir/usr/lib/
mkdir -p $pkgdir/usr/lib/cups/filter/
mkdir -p $pkgdir/usr/share/cups/model/panasonic/
cp -f $srcdir/$pkgname-$pkgver-$arch/Version.html $pkgdir/usr/share/licenses/$pkgname/Version.html

cp -f $srcdir/$pkgname-$pkgver-$arch/lib/* $pkgdir/usr/lib/
ln -sf L_H0JDJCZAZ.so.1.0.0 $pkgdir/usr/lib/L_H0JDJCZAZ.so.1
ln -sf L_H0JDJCZAZ_2.so.1.0.0 $pkgdir/usr/lib/L_H0JDJCZAZ_2.so.1
ln -sf L_H0JDJCZAZ.so.1 $pkgdir/usr/lib/L_H0JDJCZAZ.so
ln -sf L_H0JDJCZAZ_2.so.1 $pkgdir/usr/lib/L_H0JDJCZAZ_2.so

cp -f $srcdir/$pkgname-$pkgver-$arch/filter/*  $pkgdir/usr/lib/cups/filter/

#PPD_FILES=`find ppd -name *.ppd`
cp -f $srcdir/$pkgname-$pkgver-$arch/ppd/*.ppd $pkgdir/usr/share/cups/model/panasonic/

_INSTALL_PATH='$pkgdir/usr/share/panasonic/printer'
mkdir -p $_INSTALL_PATH
mkdir -p $_INSTALL_PATH/bin
# copy SPC & RCT files
_DATA_FILES=`find data`
for _file in $_DATA_FILES; do
	if test -d $_file
	then
		mkdir -p $_INSTALL_PATH/$_file
	else
		if test -f $_file
		then
			cp -f $_file $_INSTALL_PATH/$_file
		fi
	fi
done

# copy tools
cp -f $srcdir/$pkgname-$pkgver-$arch/panautil/L_H0JDUIZAZ $_INSTALL_PATH/bin/
cp -f $srcdir/$pkgname-$pkgver-$arch/panautil/L_H0JDUCZAZ $_INSTALL_PATH/bin/
chmod 4755 $_INSTALL_PATH/bin/L_H0JDUCZAZ
cp -f $srcdir/$pkgname-$pkgver-$arch/panautil/L_H0JDUIZAZ.png $_INSTALL_PATH/bin/

  mkdir -p $pkgdir/usr/share/applications
  chown root:root $pkgdir/usr/share/applications
  chmod 755 $pkgdir/usr/share/applications

  cp -f $srcdir/$pkgname-$pkgver-$arch/panautil/L_H0JDUIZAZ.desktop $pkgdir/usr/share/applications/
}
