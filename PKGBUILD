# Maintainer: Stefan Zanko <szanko at protonmail dot com>

_ver=3937963d3bde24a3dcfe99325242e3cfc7f905e0
pkgdirname=php-android-cli
pkgname=php-android-cli-git
pkgver=3937963d3bde24a3dcfe99325242e3cfc7f905e0
pkgdesc='PHP Android Clit to create/generate Scaffold Android-Studio Gradle project'
pkgrel=1
arch=(any)
license=('MIT')
url=https://github.com/homperator/php-android-cli
depends=(php)
makedepends=('git' 'composer')

source=("git+https://github.com/homperator/php-android-cli.git")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${pkgdirname}"
	pwd
	composer install
	rm -f "${srcdir}/${pkgdirname}/php-android"
}

package() {
	cd "${srcdir}/${pkgdirname}"
	echo "#!/bin/env php" >> php-android
	echo "<?php " >> php-android
	echo "include '/usr/local/lib/php-android-cli-git/index.php';" >> php-android
	mkdir -p "${pkgdir}/usr/local/lib/${pkgname}/"
	install -Dm0755 php-android "${pkgdir}/usr/local/bin/php-android"

	cp -r "${srcdir}/${pkgdirname}/tasks" "${pkgdir}/usr/local/lib/${pkgname}/tasks"
	cp -r "${srcdir}/${pkgdirname}/vendor" "${pkgdir}/usr/local/lib/${pkgname}/vendor"
	cp -r "${srcdir}/${pkgdirname}/stubs" "${pkgdir}/usr/local/lib/${pkgname}/stubs"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/local/share/licenses/$pkgname/LICENSE.md"
	install -Dm644 index.php GenerateCommand.php "${pkgdir}/usr/local/lib/$pkgname/"
}
