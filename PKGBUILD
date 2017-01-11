#Maintainer Joseph Simone <averagejoey2000 at tfwno dot gf>
#PKGBUILD currently download only, do not use.
pkgname=panamfs-scan
arch=(x86_64)
pkgver='1.3.0'
depends=(sane)
optdepends=(lightdm)
pkgdesc='sane drivers for Panasonic multifunction printers'
pkgrel=1
source=(http://cs.psn-web.net/support/fax/common/file/Linux_ScanDriver/panamfs-scan-1.3.0-x86_64.tar.gz)
md5sums=('2e4c844e89c2e7e0b6258be5ef52ace9')
package(){
_ver=$pkgver
_INSTALL_PATH="$pkgdir/usr/local/share/panasonic/scanner"
_INSTALL_SANE_DATA_PATH="$pkgdir/usr/local/share/panasonic/scanner"
_INSTALL_BIN_PATH="$pkgdir/usr/bin"


_BUILD_CPU=$arch
_TARGET_CPU=$arch

################################################################################
#
# check can install to thie system
#
_CAN_INSTALL=no
_SANE_PATH_SEARCH="/usr/lib/sane"

case $_TARGET_CPU in
	i[345]86)
		case $_BUILD_CPU in
			i386)
				_CAN_INSTALL=yes
			;;
		esac
	;;
	i686)
		case $_BUILD_CPU in
			i[36]86)
				_CAN_INSTALL=yes
			;;
		esac
	;;
	x86_64)
		case $_BUILD_CPU in
			x86_64)
				_CAN_INSTALL=yes
			;;
		esac
		_SANE_PATH_SEARCH="$_SANE_PATH_SEARCH $pkgdir/usr/lib64/sane"
	;;
	*)
	;;
esac


if test "x$_CAN_INSTALL" != "xyes"; then
	echo "This package is built for $_BUILD_CPU cpu, can not install to $_TARGET_CPU system"
    exit 1
fi



################################################################################
#
# find install dir
#
_SANELIB_PATH=""
for DIR in $_SANE_PATH_SEARCH; do
	if test -d $DIR
	then
		_SANELIB_PATH=$DIR
		break
	fi
done

if test "x$_SANELIB_PATH" = "x"
then
	echo "  Cannot find SANE lib path"
	exit 1
fi


################################################################################
#
# echo informations
#

echo
echo "    start <Panasonic MFS Scanner ($_BUILD_CPU)> install......"

################################################################################
#
# check and execute uninstall shell script
#

if test -f $_INSTALL_PATH/uninstall-driver
then
	echo "find exist scanner driver"
	echo "    execute uninstall shell script now......"
	if !($_INSTALL_PATH/uninstall-driver)
	then
		echo "    Uninstall old <Panasonic MFS Scanner Driver> failed"
		echo "    Install driver failed"
		echo
		exit 1
	fi
fi

SCRIPT=`readlink -f $0`
SCRIPTPATH=`dirname $SCRIPT`
PWD=`pwd`
cd $SCRIPTPATH

################################################################################
#
# echo informations
#

echo "    start install files......"



################################################################################
#
# sane-backend install
#
if test -f /etc/sane.d/dll.conf
then
	sed -i 's/^panamfs$//' /etc/sane.d/dll.conf
	echo "panamfs" >> /etc/sane.d/dll.conf
fi

cp ./sane-backend/panamfs.conf /etc/sane.d/panamfs.conf
chmod 0644 /etc/sane.d/panamfs.conf

cp ./sane-backend/libsane-panamfs.so.$_ver $_SANELIB_PATH/libsane-panamfs.so.$_ver
chmod 0755 $_SANELIB_PATH/libsane-panamfs.so.$_ver

#install -m 0755 -d $_INSTALL_SANE_DATA_PATH/data/cs
mkdir -p $_INSTALL_SANE_DATA_PATH/data/cs
cp ./sane-backend/po/sane-panamfs.cs.po $_INSTALL_SANE_DATA_PATH/data/cs/sane-panamfs.po
chmod 0644 $_INSTALL_SANE_DATA_PATH/data/cs/sane-panamfs.po

mkdir -p $_INSTALL_SANE_DATA_PATH/data/de/
cp ./sane-backend/po/sane-panamfs.de.po $_INSTALL_SANE_DATA_PATH/data/de/sane-panamfs.po
chmod 0644 $_INSTALL_SANE_DATA_PATH/data/de/sane-panamfs.po

mkdir -p $_INSTALL_SANE_DATA_PATH/data/en/
cp ./sane-backend/po/sane-panamfs.en.po $_INSTALL_SANE_DATA_PATH/data/en/sane-panamfs.po
chmod 0644 $_INSTALL_SANE_DATA_PATH/data/en/sane-panamfs.po

mkdir -p $_INSTALL_SANE_DATA_PATH/data/es/
cp ./sane-backend/po/sane-panamfs.es.po $_INSTALL_SANE_DATA_PATH/data/es/sane-panamfs.po
chmod 0644 $_INSTALL_SANE_DATA_PATH/data/es/sane-panamfs.po

mkdir -p $_INSTALL_SANE_DATA_PATH/data/fr/
cp ./sane-backend/po/sane-panamfs.fr.po $_INSTALL_SANE_DATA_PATH/data/fr/sane-panamfs.po
chmod 0644 $_INSTALL_SANE_DATA_PATH/data/fr/sane-panamfs.po

mkdir -p $_INSTALL_SANE_DATA_PATH/data/it/
cp ./sane-backend/po/sane-panamfs.it.po $_INSTALL_SANE_DATA_PATH/data/it/sane-panamfs.po
chmod 0644 $_INSTALL_SANE_DATA_PATH/data/it/sane-panamfs.po

mkdir -p $_INSTALL_SANE_DATA_PATH/data/ja/
cp ./sane-backend/po/sane-panamfs.ja.po $_INSTALL_SANE_DATA_PATH/data/ja/sane-panamfs.po
chmod 0644 $_INSTALL_SANE_DATA_PATH/data/ja/sane-panamfs.po

mkdir -p $_INSTALL_SANE_DATA_PATH/data/pl/
cp ./sane-backend/po/sane-panamfs.pl.po $_INSTALL_SANE_DATA_PATH/data/pl/sane-panamfs.po
chmod 0644 $_INSTALL_SANE_DATA_PATH/data/pl/sane-panamfs.po

mkdir -p $_INSTALL_SANE_DATA_PATH/data/pt/
cp ./sane-backend/po/sane-panamfs.pt.po $_INSTALL_SANE_DATA_PATH/data/pt/sane-panamfs.po
chmod 0644 $_INSTALL_SANE_DATA_PATH/data/pt/sane-panamfs.po

mkdir -p $_INSTALL_SANE_DATA_PATH/data/pt_PT/
cp ./sane-backend/po/sane-panamfs.pt_PT.po $_INSTALL_SANE_DATA_PATH/data/pt_PT/sane-panamfs.po
chmod 0644 $_INSTALL_SANE_DATA_PATH/data/pt_PT/sane-panamfs.po

mkdir -p $_INSTALL_SANE_DATA_PATH/data/ru/
cp ./sane-backend/po/sane-panamfs.ru.po $_INSTALL_SANE_DATA_PATH/data/ru/sane-panamfs.po
chmod 0644 $_INSTALL_SANE_DATA_PATH/data/ru/sane-panamfs.po

mkdir -p $_INSTALL_SANE_DATA_PATH/data/zh_CN/
cp ./sane-backend/po/sane-panamfs.zh_CN.po $_INSTALL_SANE_DATA_PATH/data/zh_CN/sane-panamfs.po
chmod 0644 $_INSTALL_SANE_DATA_PATH/data/zh_CN/sane-panamfs.po

mkdir -p $_INSTALL_SANE_DATA_PATH/data/zh_TW/
cp ./sane-backend/po/sane-panamfs.zh_TW.po $_INSTALL_SANE_DATA_PATH/data/zh_TW/sane-panamfs.po
chmod 0644 $_INSTALL_SANE_DATA_PATH/data/zh_TW/sane-panamfs.po


ln -sf $_SANELIB_PATH/libsane-panamfs.so.$_ver $SANELIB_PATH/libsane-panamfs.so.1
ln -sf $_SANELIB_PATH/libsane-panamfs.so.1 $SANELIB_PATH/libsane-panamfs.so

chown root:root /etc/sane.d/panamfs.conf
chown root:root $_SANELIB_PATH/libsane-panamfs.so.$_ver

chown root:root $_INSTALL_SANE_DATA_PATH/data/cs/sane-panamfs.po
chown root:root $_INSTALL_SANE_DATA_PATH/data/de/sane-panamfs.po
chown root:root $_INSTALL_SANE_DATA_PATH/data/en/sane-panamfs.po
chown root:root $_INSTALL_SANE_DATA_PATH/data/es/sane-panamfs.po
chown root:root $_INSTALL_SANE_DATA_PATH/data/fr/sane-panamfs.po
chown root:root $_INSTALL_SANE_DATA_PATH/data/it/sane-panamfs.po
chown root:root $_INSTALL_SANE_DATA_PATH/data/ja/sane-panamfs.po
chown root:root $_INSTALL_SANE_DATA_PATH/data/pl/sane-panamfs.po
chown root:root $_INSTALL_SANE_DATA_PATH/data/pt/sane-panamfs.po
chown root:root $_INSTALL_SANE_DATA_PATH/data/pt_PT/sane-panamfs.po
chown root:root $_INSTALL_SANE_DATA_PATH/data/ru/sane-panamfs.po
chown root:root $_INSTALL_SANE_DATA_PATH/data/zh_CN/sane-panamfs.po
chown root:root $_INSTALL_SANE_DATA_PATH/data/zh_TW/sane-panamfs.po

################################################################################


################################################################################
#
# make install dir
#
mkdir -p $_INSTALL_PATH/
mkdir -p $_INSTALL_PATH/bin
mkdir -p $_INSTALL_PATH/conf
mkdir -p $_INSTALL_PATH/data

chmod 777 $_INSTALL_PATH/conf
chmod 777 $_INSTALL_PATH/data


################################################################################
#
# Copy tool and make shortcut menu
#
if test -d /usr/local/share/applications/
then
  echo ""
else
  mkdir -p /usr/local/share/applications
  chown root:root /usr/local/share/applications
  chmod 755 /usr/local/share/applications
fi

cp ./app/PanasonicMFSTools.desktop /usr/local/share/applications/PanasonicMFSTools.desktop
chmod 0644 /usr/local/share/applications/PanasonicMFSTools.desktop

cp ./app/PanasonicMFSTools $_INSTALL_PATH/bin/PanasonicMFSTools
ln -sf $_INSTALL_PATH/bin/PanasonicMFSTools $_INSTALL_BIN_PATH/PanasonicMFSTools
cp ./app/PanasonicMFSTools.png $_INSTALL_PATH/bin/PanasonicMFSTools.png
chmod 0644 $_INSTALL_PATH/bin/PanasonicMFSTools.png



_DATA_FILES=$srcdir/$pkgname-$pkgver-$arch/app/res/*

cp -r $_DATA_FILES $_INSTALL_PATH/data/
chmod -R 777 $_INSTALL_PATH/data/


################################################################################
#
# Copy files
#
cp $srcdir/$pkgname-$pkgver-$arch/lpd/PanasonicMFSlpd $_INSTALL_PATH/bin/PanasonicMFSlpd
cp $srcdir/$pkgname-$pkgver-$arch/server/PanasonicMFSpushd $_INSTALL_PATH/bin/PanasonicMFSpushd
cp $srcdir/$pkgname-$pkgver-$arch/killserver/killpanasonicmfspushd $_INSTALL_PATH/bin/killpanasonicmfspushd
cp $srcdir/$pkgname-$pkgver-$arch/killserver/killpanasonicmfspushd.sh $_INSTALL_PATH/bin/killpanasonicmfspushd.sh
cp $srcdir/$pkgname-$pkgver-$arch/app/PanasonicMFSscan $_INSTALL_PATH/bin/PanasonicMFSscan
cp $srcdir/$pkgname-$pkgver-$arch/uninstall/uninstall-driver $_INSTALL_PATH/uninstall-driver
cp $srcdir/$pkgname-$pkgver-$arch/Version.html $_INSTALL_PATH/Version.html

ln -sf $_INSTALL_PATH/bin/PanasonicMFSscan $_INSTALL_BIN_PATH/PanasonicMFSscan



################################################################################
#
# Launch server at Login
#
cp $srcdir/$pkgname-$pkgver-$arch/server/PanasonicMFSpushd.desktop /etc/xdg/autostart/PanasonicMFSpushd.desktop


################################################################################
#
# Launch panalpd at start os
#
cp $srcdir/$pkgname-$pkgver-$arch/lpd/panasoniclpd-init /etc/init.d/panasoniclpd-init
ln -s /etc/init.d/panasoniclpd-init /etc/rc2.d/S80panasoniclpd-init
ln -s /etc/init.d/panasoniclpd-init /etc/rc3.d/S80panasoniclpd-init
ln -s /etc/init.d/panasoniclpd-init /etc/rc4.d/S80panasoniclpd-init
ln -s /etc/init.d/panasoniclpd-init /etc/rc5.d/S80panasoniclpd-init


if test -f /etc/gdm/PostSession/Default
then
	sed -i "s|^$_INSTALL_PATH/bin/killpanasonicmfspushd$||" /etc/gdm/PostSession/Default
	echo "$_INSTALL_PATH/bin/killpanasonicmfspushd" >> /etc/gdm/PostSession/Default

	sed -i 's/^killall PanasonicMFSpushd$//' /etc/gdm/PostSession/Default
	echo "killall PanasonicMFSpushd" >> /etc/gdm/PostSession/Default

	sed -i 's|^rm /var/tmp/com.panasonic.mfs.killserver.lock$||' /etc/gdm/PostSession/Default
	echo "rm /var/tmp/com.panasonic.mfs.killserver.lock" >> /etc/gdm/PostSession/Default

	sed -i 's/^exit 0$//' /etc/gdm/PostSession/Default
	echo "exit 0" >> /etc/gdm/PostSession/Default
fi


if test -f /etc/lightdm/lightdm.conf
then
	_CLEANSCRIPT=`grep session-cleanup-script= /etc/lightdm/lightdm.conf`

	if test "x$_CLEANSCRIPT" = "x"
	then
		sed -i "/\[SeatDefaults\]/a\session-cleanup-script=$_INSTALL_PATH/bin/killpanasonicmfspushd.sh" /etc/lightdm/lightdm.conf
	fi
fi
}
