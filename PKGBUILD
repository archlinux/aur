# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=grappling_hook_demo
pkgver=1
pkgrel=3
pkgdesc="first-person action/puzzle game (demo)"
arch=('i686')
url="http://ghook.speedrungames.com/"
license=("custom:EULA")
depends=('java-runtime' 'openal' 'libxrandr' 'libxcursor')
source=("http://ghook.speedrungames.com/download/GrapplingHook_Demo.tar.gz" "grappling_hook_demo.desktop")
md5sums=('70570ddd282f569144c542acc134d861'
         'c638bf71376733da5a9551abbd8a33f6')
conflicts=('grappling_hook')
options=(!strip)

build() {
true
}

package() {
mkdir -p ${pkgdir}/usr/{share/GrapplingHook_Demo,bin}
cd ${srcdir}/GrapplingHook_Demo
tar cf - * --exclude=.PKGINFO | ( cd ${pkgdir}/usr/share/GrapplingHook_Demo; tar xfp -)
find ${pkgdir}/usr/share/GrapplingHook_Demo -type f ! -name start.sh -exec chmod 644 '{}' \;
find ${pkgdir}/usr/share/GrapplingHook_Demo -type d -exec chmod 755 '{}' \;
chmod 755 ${pkgdir}/usr/share/GrapplingHook_Demo/start.sh
install -D -m644 $srcdir/grappling_hook_demo.desktop $pkgdir/usr/share/applications/grappling_hook_demo.desktop
(echo "#!/bin/bash
cd /usr/share/GrapplingHook_Demo
./start.sh \"\$@\"") > $pkgdir/usr/bin/grappling-hook-demo
chmod 755 $pkgdir/usr/bin/grappling-hook-demo
}
