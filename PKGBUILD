# Maintainer: BTD Master <btdmaster at disroot dot org>
pkgname=syphon-bin
_pkgname=syphon
pkgver=0.2.5
pkgrel=5
pkgdesc="Privacy-centric Matrix client"
arch=('x86_64')
url="https://github.com/syphon-org/syphon"
license=('AGPL3')
depends=('gtk3' 'libsecret' 'libolm' 'jsoncpp' 'sqlcipher')
provides=('syphon')
source=("https://github.com/syphon-org/syphon/releases/download/$pkgver/$_pkgname.linux.x64.tar.gz")
sha256sums=('9c9f4c09ad1e0484c87ac83302c476513c92383b4afba3a2452cc23822359368')

package() {
    install -d ${pkgdir}/opt/${_pkgname}
    install -d ${pkgdir}/usr/{bin,lib,share}
    install -d ${pkgdir}/usr/share/{pixmaps,applications}
    cp -r ${srcdir}/{data,lib,syphon} ${pkgdir}/opt/${_pkgname}
    cp ${srcdir}/lib/libjsoncpp.so.1.* ${pkgdir}/usr/lib/
    cp ${srcdir}/data/flutter_assets/assets/icons/current/app_icon_cyan.png ${pkgdir}/usr/share/pixmaps/syphon.png
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${_pkgname}.desktop" << END
[Desktop Entry]
Name=Syphon
Type=Application
Comment=Privacy-focused Matrix client
Exec=syphon
Icon=syphon
END
    ln -s ${pkgdir}/usr/lib/libjsoncpp.so.1.* ${pkgdir}/usr/lib/libjsoncpp.so.1
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/bin/sh
exec /opt/${_pkgname}/${_pkgname} "\$@"
END
}
