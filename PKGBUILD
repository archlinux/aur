# Maintainer: NotARoomba <kg5inb1@hotmail.com>
pkgname=fortuna
pkgver=1.0.0
pkgrel=1
pkgdesc="An AI powered daily quote generator!"
arch=('x86_64')
url="https://github.com/NotARoomba/Fortuna"
license=('GPL')
depends=('nodejs' 'libnotify')
makedepends=('nodejs')

prepare() {
	rm -rf $srcdir
	mkdir $srcdir
    	cd $srcdir
    	git clone $url "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	npm i
}

package() {
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share"
	install -dm755 "${pkgdir}/usr/lib/systemd/system/"
	cd "$pkgname-$pkgver"
	mkdir "${pkgdir}/usr/share/${pkgname}"
	cp ./index.js "${pkgdir}/usr/share/${pkgname}/${pkgname}.js"
	cp -fr ./node_modules "${pkgdir}/usr/share/${pkgname}/"
	echo -e "O=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\nD=true" > "${pkgdir}/usr/share/${pkgname}/secrets.env"
	ln -s "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	cp fortuna.service "${pkgdir}/usr/lib/systemd/system/fortuna.service"
	echo -e "\033[1;31mMAKE SURE TO ENABLE AND START THE SERVICE USING: \033[0;31msudo systemctl enable fortuna && sudo systemctl start fortuna \033[0m"
}
