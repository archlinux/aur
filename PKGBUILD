# Maintainer: Arthorius <Arthcomicando@gmail.com>

pkgname=mobills-nativefier
pkgver=1.0
pkgrel=1
pkgdesc="Mobills Web -  controle financeiro com c/ nativefier"
arch=(x86_64)
license=(GPL3) 
url="https://www.mobills.com.br/" 
source=(${pkgname}.png 
	${pkgname}.desktop)
makedepends=(nodejs nodejs-nativefier npm unzip)
sha256sums=('033a6e23232ca5f46b376ac8813ca101c8e8942e2b53313dd0767ccfd9c9ebea'
            'e4a9cd26c7a6c4aef144c091e3a8be565a1d6214663559bf205b6eaf578a3345')

_instname=mobills

build() {
	nativefier "https://web.mobills.com.br/" \
	--icon ${pkgname}.png \
	--maximize \
	--name ${_instname} \
	--user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0" \
	--internal-urls "(.*?mail\.google\.com.*?|.*?accounts\.google\.com.*?)" \
	--single-instance \
	--tray \
	--electron-version 7.1.11
}

package() {
	install -d ${pkgdir}/opt ${pkgdir}/usr/{bin,share/pixmaps}
	install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${_instname}.desktop

	cp -rL ${_instname}-linux-* ${pkgdir}/opt/${pkgname}
	ln -sf /opt/${pkgname}/${_instname} ${pkgdir}/usr/bin/${_instname}
	ln -sf /opt/${pkgname}/resources/app/icon.png ${pkgdir}/usr/share/pixmaps/${_instname}.png

	chmod 666 ${pkgdir}/opt/${pkgname}/resources/app/nativefier.json
	chmod 7455 ${pkgdir}/opt/${pkgname}/chrome-sandbox
}
