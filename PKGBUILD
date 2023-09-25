# Maintainer: xyzzy

pkgname=ryujinx-bin
pkgver=1.1.1023
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

b2sums=('bc43d6a45e6edf6c96d30abd82fea8ed6549f963991ad2ee8159bd8a4dc9e2cad49a66b8f1d02972eb3608595b95f5d1224b6d3e906ff349b2bbb67c1816b6cf'
        'ed7edb44c1b6ace90c00738754577b8779b34847e286662971ecc148871b1995698adcc4a0841b4bd7d804d1b0aee960565f9c68680abb9ade55f46fd89b1863'
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
	
	install -D "${srcdir}/Ryujinx.desktop" "${pkgdir}/usr/share/applications/Ryujinx.desktop"
	install -D "${srcdir}/Logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/Ryujinx.svg"
	install -D "${srcdir}/Ryujinx.xml" "${pkgdir}/usr/share/mime/packages/Ryujinx.xml"
}
