# Maintainer: Chance Chen <ufbycd@163.com>

pkgname=eclipse-embedcpp
pkgver=4.31
_release=2024-03
pkgrel=1
pkgdesc="Eclipse IDE for Embedded C/C++ Developers(Chinese Mirror)"
arch=('x86_64')
url="https://www.eclipse.org"
license=('EPL')
groups=()
depends=("java-runtime>=11" webkit2gtk unzip)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)

_src=$pkgname-$_release-R-linux-gtk-x86_64.tar.gz
source=("${pkgname}-${_release}.tar.gz::https://mirrors.ustc.edu.cn/eclipse/technology/epp/downloads/release/$_release/R/$_src")
md5sums=('2530465978a6edf9bcfc4839c63362d6')

package() {
    install -d "$pkgdir/usr/share/$pkgname"
    cp -af eclipse/* "$pkgdir/usr/share/$pkgname"

    install -D /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/bash
export ECLIPSE_HOME=/usr/share/$pkgname
exec \$ECLIPSE_HOME/eclipse "\$@"
END

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<END
[Desktop Entry]
Name=Eclipse-Embedcpp
Comment=Eclipse IDE for Embedded C/C++ Developers
Icon=/usr/share/$pkgname/icon.xpm
Exec=/usr/share/$pkgname/eclipse
Terminal=false
Type=Application
Categories=Development;IDE;Java;
StartupNotify=true
END
}
