# Maintainer: Stephanie Hobbs (RX14) <steph@rx14.co.uk>

pkgname=rclonesync-git
pkgver=2.9.r39
pkgrel=1
pkgdesc="A Bidirectional Cloud Sync Utility using rclone"
arch=("any")
url="https://github.com/cjnaz/rclonesync-V2"
license=("MIT")
depends=("python" "rclone")
makedepends=("git")
source=("rclonesync::git+${url}")
sha256sums=('SKIP')
            
pkgver() {
    cd rclonesync

    local project_version="$(python rclonesync.py -V | sed -E 's|^rclonesync.py V(.+) (.+)$|\1|')"
    printf "%s.r%s" "$project_version" "$(git rev-list --count HEAD)"
}

package() {
    cd rclonesync

    install -m 0755 -d "$pkgdir"/usr/bin
    install -m 0755 rclonesync.py "$pkgdir"/usr/bin/rclonesync
}
