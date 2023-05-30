# Maintainer: Shae VanCleave

# Metadata
#  Info
pkgname=vintagestory-servermgr
pkgdesc="systemd unit and script for managing a Vintage Story server"
pkgver=1.1.1
pkgrel=1
#  Requirements
depends=('vintagestory-server')
arch=('any')
#  Source
url="https://github.com/Tiger-Tom/vintagestory-servermgr"
license=('MIT')
source=("https://github.com/Tiger-Tom/vintagestory-servermgr/archive/refs/tags/v$pkgver.zip"
        "vintagestory-servermgr.install")
md5sums=('f4a08337c8a44a853a3c1e7ce0343705'
         '76ea3b5557596621c28ca3eb0dba1c0b')
#  Keep save
backup=('var/vintagestory/server-data/')

# Installation
install=vintagestory-servermgr.install

package() {
    # Install sysuser and tmpfile
    install -Dm644 "$pkgname"-"$pkgver"/vintagestory-server.sysusers "$pkgdir"/usr/lib/sysusers.d/"$pkgname".conf
    install -Dm644 "$pkgname"-"$pkgver"/vintagestory-server.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/"$pkgname".conf
    # Copy launcher script
    install -Dm755 -g vintagestory-server "$pkgname"-"$pkgver"/"$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
    # Copy service and socket
    install -Dm644 "$pkgname"-"$pkgver"/vintagestory-server.service "$pkgdir"/usr/lib/systemd/system/vintagestory-server.service
    install -Dm644 "$pkgname"-"$pkgver"/vintagestory-server.socket "$pkgdir"/usr/lib/systemd/system/vintagestory-server.socket
}
