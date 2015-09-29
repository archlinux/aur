### Original Maintainer and Contributor ###
# Maintainer:  Xiaoxiao Pu <i@xiaoxiao.im>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=haroopad
pkgver=0.13.1
pkgrel=4
pkgdesc="A markdown enabled document processor"
arch=('i686' 'x86_64')
url="http://pad.haroopress.com/"
changelog=('changelog')
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
sha256sums_i686=('bc8a162fbaa1f43e6b6f6a29b1be35df7eb87cf3988f14f4aaa1ecbb035f8ec6')
sha256sums_x86_64=('ff04f500d6809491d1154bccc8c1ee1f02139a845290774d49ddd6f4c042832a')

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
