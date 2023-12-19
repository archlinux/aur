# Maintainer: Diego Parra <diegoparranava@protonmail.com>
pkgbase='waypaper-engine-git'
pkgname='waypaper-engine'
pkgver=v1.2.1.r0.g09eb623
pkgrel=1
pkgdesc="An Electron-based graphical frontend for setting wallpapers and playlists"
arch=('x86_64')
url="https://github.com/0bCdian/Waypaper-Engine"
license=('GLP')
depends=('swww' 'nodejs')
makedepends=('npm' 'git')
provides=('waypaper-engine')
source=('waypaper-engine::git+https://github.com/0bCdian/Waypaper-Engine.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  result="$(git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
  echo "$result"
}


build() {
    cd "$pkgname"
	cd daemon
	npm run build
	cd ..
	npm run build
}

package() {
    cd "$pkgname"
    install -Dm755 ./cli/waypaper-engine "$pkgdir/usr/bin/${pkgname}"
    install -dm755 "$pkgdir/opt/${pkgname}"
    install -Dm644 ./waypaper-engine.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/${pkgname}"
    install -Dm644 "./release/linux-unpacked/resources/icons/app.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    cp ./release/linux-unpacked/* -rt "$pkgdir/opt/${pkgname}"
}
