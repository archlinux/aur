### Original Maintainer and Contributor ###
# Maintainer:  Xiaoxiao Pu <i@xiaoxiao.im>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=haroopad
pkgver=0.13.2
pkgrel=1
pkgdesc="A markdown enabled document processor"
arch=('i686' 'x86_64')
url="http://pad.haroopress.com/"
changelog='changelog'
license=('custom')
depends=('xdg-utils'
         'desktop-file-utils'
         'gconf'
         'python'
         'alsa-lib'
         'gtk2'
	 'libnotify'
         'nss')
options=('!strip')
install=${pkgname}.install

source=("x-markdown.xml")
source_i686=("https://bitbucket.org/rhiokim/haroopad-download/downloads/${pkgname}-v${pkgver}-ia32.deb")
source_x86_64=("https://bitbucket.org/rhiokim/haroopad-download/downloads/${pkgname}-v${pkgver}-x64.deb")

sha256sums=('8261b526007db35c8691b3b6bf79cf40639a5e53fa81f1dd1fa4ea1cf5c440dd')
sha256sums_i686=('c592389ba183af5dedf542adfce074707077d6d581137579f05eb2f996143233')
sha256sums_x86_64=('46eddf00972e5b27fbe2da835ab0ae2c2f30e7daf2d1c615905bf603e445d1b4')

build() {
	cd "${srcdir}"
	tar -zxf data.tar.gz
}

package() {
	cd "${srcdir}"
	cp -r "${srcdir}/usr" "${pkgdir}/usr"
	sed -i -e 's/libudev.so.0/libudev.so.1/g' "${pkgdir}/usr/share/haroopad/haroopad"
	rm "${pkgdir}/usr/share/applications/mimeapps.list"
	mkdir "${pkgdir}/usr/share/doc/haroopad/"
	mv "${pkgdir}/usr/share/doc/changelog" "${pkgdir}/usr/share/doc/copyright" "${pkgdir}/usr/share/doc/haroopad/"
	install -Dm644 x-markdown.xml "${pkgdir}/usr/share/mime/packages/x-markdown.xml"
	install -Dm644 "${pkgdir}/usr/share/doc/haroopad/copyright" "${pkgdir}/usr/share/licenses/haroopad/LICENSE"
}
