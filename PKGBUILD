# Maintainer: Henry Fiantaca <hfiantaca@gmail.com>
pkgname=grip-wpirobotics-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="GRIP Computer Vision Engine, generates C++ and java code for opencv use in FRC robots"
arch=(x86_64)
url="http://wpiroboticsprojects.github.io/GRIP/#/"
license=('custom')
depends=(java-runtime)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/WPIRoboticsProjects/GRIP/releases/download/v1.5.2/grip-1.5.2-x64.deb"
        "https://raw.githubusercontent.com/WPIRoboticsProjects/GRIP/master/LICENSE.txt")
sha256sums=("3bacd7ee72b4fa0c0bbb613e3823d362a880f0d9d8132c136cdac57a6b49ee6c"
            "ca4fbc73b15a3754fe97794157f7c2da90dc7df67f4e1989cf0bf6ded9e2f4ef")

prepare() {
    mkdir -p "$srcdir"/grip_root
	cd "$srcdir"/grip_root
	tar -xf ../data.tar.xz
}

package() {
	cd "$pkgdir"
	cp -r "$srcdir"/grip_root/* .
	mkdir -p usr/share/applications usr/bin usr/share/license/grip-wpirobotics-bin 
	cp "$srcdir"/LICENSE.txt usr/share/license/grip-wpirobotics-bin/LICENSE
	ln -s /opt/GRIP/GRIP usr/bin/GRIP
	cat >> usr/share/applications/GRIP.desktop << EOF
[Desktop Entry]
Name=GRIP
Comment=GRIP
Exec=/opt/GRIP/GRIP
Icon=/opt/GRIP/GRIP.png
Terminal=false
Type=Application
Categories=Development;
EOF
    
}
