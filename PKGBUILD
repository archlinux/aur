# Maintainer: Moritz Poldrack <moritz at poldrack dot dev>
pkgname=ttf-font-awesome-pro
provides=('ttf-font-awesome')
pkgver=6.1.1
pkgrel=1
pkgdesc='The Pro Version of the famous FontAwesome Icons. Requires an active Subscription!'
arch=('any')
url='https://fontawesome.com'
license=('custom:Font Awesome Pro License')
makedepends=(
	'grep'
	'npm'
)

prepare() {
	getToken=0
	npm config get | grep '//npm.fontawesome.com/:_authToken' > /dev/null 2>&1 || getToken=1

	if [ $getToken != 0 ]; then
		echo "Please enter your 'Pro npm Package Token'. You may find it under https://fontawesome.com/account"
		echo -n "Token: "
		read token

		npm config set "@fortawesome:registry" https://npm.fontawesome.com/
		npm config set "//npm.fontawesome.com/:_authToken" $token
	fi
}

build() {
	rm -rf "${srcdir}"
	mkdir -p "${srcdir}"
	cd "${srcdir}"
	npm init -y
	npm install @fortawesome/fontawesome-pro@${pkgver}
}

package() {
	mkdir -p "${pkgdir}/usr/share/fonts/TTF/" "${pkgdir}/usr/share/licenses/ttf-font-awesome-pro/"

	install "${srcdir}/node_modules/@fortawesome/fontawesome-pro/webfonts/fa-brands-400.ttf" "${pkgdir}/usr/share/fonts/TTF/"
	install "${srcdir}/node_modules/@fortawesome/fontawesome-pro/webfonts/fa-duotone-900.ttf" "${pkgdir}/usr/share/fonts/TTF/"
	install "${srcdir}/node_modules/@fortawesome/fontawesome-pro/webfonts/fa-light-300.ttf" "${pkgdir}/usr/share/fonts/TTF/"
	install "${srcdir}/node_modules/@fortawesome/fontawesome-pro/webfonts/fa-regular-400.ttf" "${pkgdir}/usr/share/fonts/TTF/"
	install "${srcdir}/node_modules/@fortawesome/fontawesome-pro/webfonts/fa-solid-900.ttf" "${pkgdir}/usr/share/fonts/TTF/"
	install "../LICENSE" "${pkgdir}/usr/share/licenses/ttf-font-awesome-pro/"
}

