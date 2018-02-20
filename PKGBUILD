# Maintainer: Paul Wilk <paul.wilk@null.net>

pkgname=google-keep-desktop
pkgver=1.7.9
pkgrel=1
pkgdesc='Google Keep packaged as a desktop application'
url='https://keep.google.com/'
license=('unknown')
arch=('x86_64')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
makedepends=('nodejs-nativefier')

build() {
	cd "${srcdir}"

	nativefier keep.google.com \
		--name 'google-keep' \
		--disable-context-menu \
		--disable-dev-tools \
		--width 700px \
		--height 700px
}

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/"{opt,usr/bin}
	cp -r google-keep-linux-x64 "${pkgdir}/opt/google-keep"

	cd "${pkgdir}"
	chmod 755 opt/google-keep/resources/app
	ln -s ../../opt/google-keep/google-keep usr/bin/google-keep-desktop
}
