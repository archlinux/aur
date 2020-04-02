# Maintainer: deconf <chenjiagen88@gmail.com>

_pkgname=unlock-netease-music
pkgname=${_pkgname}-git
pkgver=0.24.1.r7.g595ba6d
pkgrel=1
pkgdesc="Revive unavailable songs for Netease Cloud Music"
arch=('i686' 'x86_64')
url="https://github.com/nondanee/UnblockNeteaseMusic"
license=('MIT')
depends=('nodejs')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
backup=("usr/lib/systemd/system/UnblockNeteaseMusic.service")
source=("$pkgname"::"git+${url}.git"
        "UnblockNeteaseMusic.service"
        )
md5sums=('SKIP'
         '8f5802043d3d51cc31ed063add2ebc4d')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
        install -d 755 ${pkgdir}/opt/UnblockNeteaseMusic
    	cp -r "${srcdir}/${pkgname}/"/*  "${pkgdir}/opt/UnblockNeteaseMusic/"
        install -D -m644 "${srcdir}/UnblockNeteaseMusic.service" "${pkgdir}/usr/lib/systemd/system/UnblockNeteaseMusic.service" 
}
