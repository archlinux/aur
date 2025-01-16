# Maintainer: Bruceutut
pkgname=alipay-keytool
pkgver=2.0.3
pkgrel=1
pkgdesc="支付宝开放平台密钥工具"
arch=('x86_64')
url="https://opendocs.alipay.com/open/02kipk?pathHash=3dce99f3"
license=('unknown')
depends=('electron' 'java-runtime')
source=("AlipayKeyTool-$pkgver.exe::https://mdn.alipayobjects.com/ind_developertool/afts/file/A*kxmIR56rP-UAAAAAAAAAAAAADlx-AQ?af_fileName=AlipayKeyTool-$pkgver.exe")
sha256sums=('bf7845513fc759110ba56617fa28abccc70833855ec540741571375f5889993c')

package() {
	cd "$pkgdir"
	mkdir -p "$pkgdir/opt/$pkgname"
	cp -r "$srcdir/resources" "$pkgdir/opt/$pkgname"
	cp -r "$srcdir/pack" "$pkgdir/opt/$pkgname"
	cp -r "$srcdir/locales" "$pkgdir/opt/$pkgname"

	# Link Java environment
	mkdir -p "$pkgdir/opt/$pkgname/pack/jre/mac/bin"
	ln -s /usr/bin/java "$pkgdir/opt/$pkgname/pack/jre/mac/bin/java"

	# Start script
	echo """#!/usr/bin/env bash
electron /opt/$pkgname/resources/app
""" > "$pkgdir/opt/$pkgname/alipay-keytool"
	chmod +x "$pkgdir/opt/$pkgname/alipay-keytool"
	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/$pkgname/alipay-keytool "$pkgdir/usr/bin/alipay-keytool"

	# Desktop entry
	mkdir -p "$pkgdir/usr/share/applications"
	echo """[Desktop Entry]
Name=Alipay Key Tool
Comment=Alipay open platform key tool
Name[zh_CN]=支付宝开放平台密钥工具
Comment[zh_CN]=支付宝开放平台密钥工具
Exec=alipay-keytool %U
Icon=/opt/$pkgname/resources/app/static/keyToolLogo.7d74dc81.png
Terminal=false
Type=Application
Categories=Development;
""" > "$pkgdir/usr/share/applications/alipay-keytool.desktop"
}
