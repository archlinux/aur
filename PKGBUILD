pkgname=gpt-cli
pkgver=0.0.14
pkgrel=1
pkgdesc="Run linux commands with natural language. Eg.: 'show my graphic card' instead 'lspci | grep VGA'"
arch=('x86_64')
url="https://github.com/gustawdaniel/gpt-cli"
depends=('xorg-server-devel' 'libxcb')
options=()
source_x86_64=("https://github.com/gustawdaniel/gpt-cli/releases/download/v0.0.14/gpt-cli")
sha512sums_x86_64=('b9653478daf24af90c35634c94d40cc8c1cb735137a44fdbad33264c90d2ea0051c658e86c719fab72dd461899e93caf72cde06d8c1b4127e9589e5176686a9f')

package(){
    ls ${pkgdir}
	# Extract package data
# 	tar xf data.tar.xz -C "${pkgdir}"
# 	install -D -m644 "${pkgdir}/opt/InfinityWallet/resources/app.asar.unpacked/node_modules/phantomjs-prebuilt/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
# 	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
    cp gpt-cli /usr/local/bin/gpt-cli
	# Link to the binary
	ln -s /usr/local/bin/p /usr/local/bin/gpt-cli

	# SUID chrome-sandbox for Electron 5+
# 	chmod 4755 '/opt/InfinityWallet/chrome-sandbox' || true

	update-mime-database /usr/share/mime || true
	update-desktop-database /usr/share/applications || true
	update-desktop-database -q
}

post_upgrade() {
	post_install
}

post_remove() {
# 	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor

	# Delete the link to the binary
	rm -f '/usr/local/bin/p' /usr/local/bin/gpt-cli
	update-desktop-database -q
}
