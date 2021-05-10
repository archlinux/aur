# Maintainer: taotieren <admin@taotieren.com>

pkgname=nucleistudioide
pkgver=202102
pkgrel=3
pkgdesc="Nuclei Studio IDE 是基于 MCU Eclipse IDE 开发的一款针对芯来公司处理器核产品的集成开发环境工具，用于 RISC-V 开发继承了 Eclipse IDE 平台的各种优势。"
arch=("x86_64")
makedepends=('xdg-user-dirs' 'imagemagick')
depends=('java-runtime' 'jlink-software-and-documentation' 'ncurses5-compat-libs' 'glibc' 'libusb' 'openocd')
optdepends=()
conflicts=()
url="https://www.nucleisys.com/download.php"
license=('unknow')
options=(!strip)

source=("https://www.nucleisys.com/upload/files/nucleistudio/NucleiStudio_IDE_202102-lin64.tgz")
sha256sums=('a005671317725f33e177d2ba9272cd77e0c04ef3d28c7cf8de4565c3f83b651e')

package() {
	cd "$srcdir"

	msg2 'Installing Nuclei Studio IDE'
	install -d -m755 "${pkgdir}/opt/nuclei"
	tar zxf "NucleiStudio_IDE_${pkgver}-lin64.tgz"
	mv "${srcdir}/NucleiStudio_IDE_${pkgver}/NucleiStudio" "${pkgdir}/opt/nuclei"

	msg2 'Instalation of binary file'
	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<END
#!/bin/sh
/opt/nuclei/NucleiStudio/NucleiStudio "\$@"
END

	msg2 'Installing desktop shortcut'
	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${pkgname}.desktop" <<END
[Desktop Entry]
Name=NucleiStudioIDE
Comment=NucleiStudioIDE
GenericName=NucleiStudioIDE
Exec=env GDK_BACKEND=x11 NucleiStudio %F
Icon=
Path=/opt/nuclei/NucleiStudio/
Terminal=false
StartupNotify=true
Type=Application
Categories=Development
END

}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set ts=8 sw=8 tw=0 noet:
