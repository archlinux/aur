# Maintainer: Diego Parra <diegoparranava@protonmail.com>
pkgname='waypaper-engine'
pkgver=1.2.2
pkgrel=2
pkgdesc="An Electron-based graphical frontend for setting wallpapers and playlists"
arch=('x86_64')
url="https://github.com/0bCdian/Waypaper-Engine"
license=('GLP')
depends=('swww' 'nodejs')
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
    install -Dm755 "./release/linux-unpacked/resources/icons/app.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    install -dm755 "$pkgdir/opt/${pkgname}"
    install -Dm644 ./waypaper-engine.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/${pkgname}"
    cp ./release/linux-unpacked/* -rt "$pkgdir/opt/${pkgname}"
}
