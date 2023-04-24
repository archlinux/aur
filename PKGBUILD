# Maintainer: ThePirate42 <aur@thepirate42.org>

pkgname=keepass-plugin-sftpsync
pkgver=2.2
pkgrel=1
pkgdesc="This plugin adds support for loading/saving files from/to servers via SFTP and SCP (updated fork by Shellster)"
arch=('any')
license=('unknown')
depends=('keepass')
url="https://keepass.info/plugins.html#sftpsync"
source=("sftpsync.tar.gz::https://github.com/shellster/keepass-sftp-sync/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8943bed987e91ea3c1f69fdb72f1904db56fe366fbb61c4f318fe3c83437dcbe')

prepare(){
	
	mkdir -p "${srcdir}/build/SftpSync"
	pushd "${srcdir}/keepass-sftp-sync-${pkgver}/SftpSync"
	cp -r Properties *.cs *.csproj Renci.SshNet.dll "${srcdir}/build/SftpSync"
	popd
	
}

build(){
	
	keepass --plgx-create "${srcdir}/build/SftpSync" --plgx-prereq-kp:2.18 --plgx-prereq-net:4.0
	
}

package(){
	
	install -d -m755 "${pkgdir}/usr/share/keepass/Plugins"
	install -m644 "${srcdir}/build/SftpSync.plgx" "${pkgdir}/usr/share/keepass/Plugins/SftpSync.plgx"
	
}
