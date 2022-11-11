# Maintainer: iridiumR <i@iridium.cyou>
pkgname=maixpy-ide-bin
_pkgname=maixpy-ide
pkgver=0.2.5
pkgrel=3
pkgdesc="Micropython env for Sipeed Maix boards"
arch=('x86_64')
url="https://dl.sipeed.com/MAIX/MaixPy/ide/"
license=('custom')
depends=('libusb' 'python-pyusb' 'qt5-multimedia' 'qt5-script' 'qt5-svg' 'qt5-tools' 'qt5-webengine' 'qt5-3d')
provides=(maixpy-ide)
conflicts=(maixpy-ide)
replaces=()
changelog=
source=(manual://maixpy-ide-linux-x86_64-$pkgver-installer-archive.7z
local://icon.png)
noextract=()
sha512sums=('a629276e4f11be322b05a6bc52b4327cbbe8c5c29a519ff78894593ce8a284bb1a4152557d34c4c09d83b201fcedb7f57d3c5f6c3611f08bb1ef791938a40abf'
            '76204fb81ac8a5f8a22206846962a89deff2e8cf31babd84a32711432b748621da48c80a5585fd11f7c92b2804347741fdd7eb6894780b9883d1307b03212a7d')

package() {
cd "${srcdir}"

# Install the application to /opt/maixpy-ide/
mkdir -p "${pkgdir}/opt/${_pkgname}/"
cp -a share/ "${pkgdir}/opt/${_pkgname}/"
cp -a lib/ "${pkgdir}/opt/${_pkgname}/"
cp -a bin/ "${pkgdir}/opt/${_pkgname}/"
cp icon.png "${pkgdir}/opt/${_pkgname}/icon.png"
chmod 755 "${pkgdir}/opt/${_pkgname}/bin/maixpyide.sh"

# Add the symbolic link to /usr/bin/
mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/${_pkgname}/bin/maixpyide.sh" "${pkgdir}/usr/bin/${_pkgname}"

# Add the desktop entry
mkdir -p "${pkgdir}/usr/share/applications/"
echo -e "[Desktop Entry]
Name=MaixPy IDE
Comment=Micropython env for Sipeed Maix boards.
Exec=maixpy-ide %f
Icon=/opt/$_pkgname/icon.png
Terminal=false
Type=Application
Categories=Development" > "$pkgdir/usr/share/applications/maixpy-ide.desktop"
chmod -R 0755 "$pkgdir"
}

