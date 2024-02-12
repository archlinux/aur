# Maintainer: Diego Parra <diegoparranava@protonmail.com>
pkgname='waypaper-engine'
pkgver=1.2.7
pkgrel=1
pkgdesc="A pleasant gui frontend for swww with batteries included!"
arch=('x86_64')
url="https://github.com/0bCdian/Waypaper-Engine"
license=('GLP')
depends=('swww' 'nodejs' 'socat' 'hicolor-icon-theme')
makedepends=('npm' 'git')
provides=('waypaper-engine')
_archive="Waypaper-Engine-$pkgver"
source=("$_archive.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
	cd "$_archive"
	cd daemon
	npm run build
	cd ..
	npm run build
}

package() {
	cd "$_archive"
	install -Dm755 ./cli/waypaper-engine "$pkgdir/usr/bin/${pkgname}"
	for _icons in 16x16 32x32 64x64 128x128 256x256 512x512; do
		install -Dm755 "./release/linux-unpacked/resources/icons/${_icons}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
	done
	install -dm755 "$pkgdir/opt/${pkgname}"
	install -Dm644 ./waypaper-engine.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/${pkgname}"
	cp ./release/linux-unpacked/* -rt "$pkgdir/opt/${pkgname}"
}
