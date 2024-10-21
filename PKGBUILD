# Maintainer: Sergey Shatunov <me@aur.rocks>
# Contributor: Laurin Neff <laurin at laurinneff dot ch>
pkgname=satisfactory-mod-manager
pkgver=3.0.3
pkgrel=1
pkgdesc="A mod manager for easy installation of mods and modloader for Satisfactory"
arch=(x86_64)
url="https://github.com/satisfactorymodding/SatisfactoryModManager"
license=('GPL3')
makedepends=('git' 'yarn' 'nodejs' 'node-gyp' 'python' 'wails' 'go-task' 'pnpm')
depends=('webkit2gtk' 'gst-plugins-good')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/satisfactorymodding/SatisfactoryModManager/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha512sums=('6fe7fb7ce68b0eeee86e9fca3029b9ffe341ac957ddc077357184459af93bf1fe7e6c9ea8e3b6cfaa0b81870070cdf1c3bae99e26d4c0a4a5f6b76b7e823453c'
            '6271ba738cb17a787c33fede390aa86381e22ea3e7ffd44b7bef74f26d4a59c26bb803783ce61feec8d0eb596bd0d5bd5f2ad917fb0a684a091763d8f6ada1fe')

build() {
	cd "${srcdir}/SatisfactoryModManager-$pkgver"
	go-task build
}

package() {
	cd "${srcdir}/SatisfactoryModManager-$pkgver"

	install -dm755 "${pkgdir}/usr/share/icons/hicolor"
	for i in 16 32 64 128 256 512; do
		install -Dm644 icons/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname%-git}.png"
	done

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 build/bin/SatisfactoryModManager "${pkgdir}/usr/bin/satisfactory-mod-manager"

	install -Dm644 "${srcdir}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
}
