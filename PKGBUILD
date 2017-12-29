# Maintainer: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=mkinitcpio-docker-hooks
pkgver=1.3
pkgrel=2
pkgdesc="mkinitcpio hooks that provides support for using docker image as root"
arch=(any)
url="https://github.com/zasdfgbnm/mkinitcpio-docker-hooks"
license=('GPL')
groups=('base')
depends=('mkinitcpio' 'btrfs-progs')
makedepends=('go')
backup=(etc/docker-btrfs.json)
source=('install_docker-btrfs' 'hooks_docker-btrfs' 'etc_docker-btrfs.json' 'get-docker-cache-id.go')
md5sums=('5ce9a3498b0af7e9fbbe830893da83e3'
         '9cd936fde5d9946beba090e7e5f623b6'
         '4df2fd7306aef1e3d94ffc6b05056728'
         'cdfc2b962060921d415134192a540dd1')

build() {
    go build get-docker-cache-id.go
}

package() {
    install -Dm755 get-docker-cache-id "${pkgdir}/usr/bin/get-docker-cache-id"
    install -Dm644 install_docker-btrfs "${pkgdir}/usr/lib/initcpio/install/docker-btrfs"
    install -Dm644 hooks_docker-btrfs "${pkgdir}/usr/lib/initcpio/hooks/docker-btrfs"
    install -Dm644 etc_docker-btrfs.json "${pkgdir}/etc/docker-btrfs.json"
}
