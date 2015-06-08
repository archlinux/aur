# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Stephen Martin <hwkiller at gmail dot com>
pkgname=razer-blackwidow-macro-scripts
pkgver=2
pkgrel=1
pkgdesc="Scripts to create and execute macros for the macro keys of the razer-blackwidow ultimate 2013 keyboard"
arch=('any')
url='http://www.google.com'
license=('Public Domain')
groups=()
depends=('xmacro' 'python2-pyusb')
provides=('blackwidow-enable-macro-keys')
conflicts=('blackwidow-enable-macro-keys')
install='razer-blackwidow-macro-scripts.install'
source=('macroPrompt.sh'
	'macroRun.sh'
	'99-blackwidow.rules'
	'blackwidow_enable.py')
md5sums=('22cb7243cdefe7229b5960ae92caf671'
         '8a56b47c6d20999e886761d6ddac6379'
         'ee48c52536d7ff63992beac14ab2532c'
         'd7c158214ee3a849e00fc25a034ed93a')
	
prepare(){
	cd $srcdir
	sed 's^#!/usr/bin/python^#!/usr/bin/env python2^g' \
		-i "$srcdir/blackwidow_enable.py"
}

package() {
	cd "$srcdir"
	install -D -m 644 macroPrompt.sh $pkgdir/usr/bin/macroPrompt.sh
	install -D -m 644 macroRun.sh $pkgdir/usr/bin/macroRun.sh
	install -D -m 644 99-blackwidow.rules $pkgdir/usr/lib/udev/rules.d/99-blackwidow.rules
	install -D -m 755 blackwidow_enable.py $pkgdir/usr/bin/blackwidow-enable
}
