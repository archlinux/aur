# Maintainer: xyzzy

pkgname=ryujinx-bin
pkgver=1.1.1101
pkgrel=1
pkgdesc='Experimental Nintendo Switch Emulator written in C# (master build channel release)'
arch=(x86_64)
url='https://github.com/Ryujinx/release-channel-master'
license=('MIT')
depends=('dotnet-runtime')
provides=(ryujinx)
conflicts=(ryujinx Ryujinx)
options=('!strip')
source=("${url}/releases/download/${pkgver}/ryujinx-${pkgver}-linux_x64.tar.gz"
        'https://raw.githubusercontent.com/Ryujinx/Ryujinx/master/distribution/linux/Ryujinx.desktop'
        'https://raw.githubusercontent.com/Ryujinx/Ryujinx/master/distribution/misc/Logo.svg'
        'https://raw.githubusercontent.com/Ryujinx/Ryujinx/master/distribution/linux/mime/Ryujinx.xml')

b2sums=('aa323295c249bf87637e7c0ae0c3e200436fdd64a59929b8d37f8fce1fc73a2d438ea06d688efb2fc2b9c013aff081707f7571c4bc58b9fa998d81a48f6db115'
        'f9ca3827df3a5cdd907495f580233c89aa12747f334200a6a77363370509037aceecb0b7fe6ba4d7a1043af3a6e7ffc5ae90ab135e40d052edb0dc142b83022e'
        'f96fe6146018fd869c55e413b2cc6cf12f17c5257af52df14f57978133792c7fb76e8526b15a5120dbf12a9fed7b8e4723a3ff9f2e45b613b10ee1017ba0b996'
        '0002cccf2a3e9dec4b0646e8d50ed105dfd4544baf49ae4868cc2a0785839ab578171063b6149b54fee947a38d88bbd6552647f6c69c590acf8fd1b12835c67a')

package() {
	mkdir --parents "${pkgdir}/opt"
	cp --recursive "${srcdir}/publish" "${pkgdir}/opt/ryujinx"
	chmod +x "${pkgdir}/opt/ryujinx/Ryujinx"

	# create writable logs directory
	install --directory --mode=777 "${pkgdir}/opt/ryujinx/Logs"
	
	mkdir --parents "${pkgdir}/usr/bin"
	ln --symbolic "/opt/ryujinx/Ryujinx" "${pkgdir}/usr/bin/Ryujinx"
	ln --symbolic "/opt/ryujinx/Ryujinx.sh" "${pkgdir}/usr/bin/Ryujinx.sh"
	
	install -D "${srcdir}/Ryujinx.desktop" "${pkgdir}/usr/share/applications/Ryujinx.desktop"
	install -D "${srcdir}/Logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/Ryujinx.svg"
	install -D "${srcdir}/Ryujinx.xml" "${pkgdir}/usr/share/mime/packages/Ryujinx.xml"
}
