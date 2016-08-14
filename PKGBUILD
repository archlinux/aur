# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=grappling_hook
pkgver=1
pkgrel=2
pkgdesc="first-person action/puzzle game"
arch=('i686' 'x86_64')
url="http://ghook.speedrungames.com/"
license=("custom:EULA")
depends=('java-runtime' 'openal' 'libxrandr' 'libxcursor')
source=("http://ghook.speedrungames.com/download/GrapplingHook.tar.gz"
	"grappling_hook.desktop"
	"http://ghook.speedrungames.com/download/GrapplingHookLinuxHotfix.7z")
md5sums=('05e92f02315b74320c80cfbe7ff71869'
         'a5aa5d5bf354d33e24feb751680668a6'
         'ce53fee8a47f6a70b3a38d58caa7773e')
conflicts=('grappling_hook_demo')
options=(!strip)

build() {
true
}

package() {
mkdir -p ${pkgdir}/usr/{share/GrapplingHook,bin}
cd ${srcdir}/GrapplingHook
tar cf - * --exclude=.PKGINFO | ( cd ${pkgdir}/usr/share/GrapplingHook; tar xfp -)
mv ${srcdir}/lib/* ${pkgdir}/usr/share/GrapplingHook/lib
find ${pkgdir}/usr/share/GrapplingHook -type f ! -name start.sh -exec chmod 644 '{}' \;
find ${pkgdir}/usr/share/GrapplingHook -type d -exec chmod 755 '{}' \;
chmod 755 ${pkgdir}/usr/share/GrapplingHook/start.sh
install -D -m644 $srcdir/grappling_hook.desktop $pkgdir/usr/share/applications/grappling_hook.desktop
(echo "#!/bin/bash
cd /usr/share/GrapplingHook
./start.sh \"\$@\"") > $pkgdir/usr/bin/grappling-hook
chmod 755 $pkgdir/usr/bin/grappling-hook
}
