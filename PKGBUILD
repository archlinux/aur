# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=gnome-shell-extension-allow-locked-remote-desktop-git
_pkgname=allow-locked-remote-desktop
pkgver=2024.04.08.g198a9a5
pkgrel=1
pkgdesc='Allow locked Remote Desktop for GNOME Shell'
arch=('any')
url='https://github.com/jikamens/allow-locked-remote-desktop'
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=('git')
source=("git+https://github.com/jikamens/$_pkgname.git")
sha256sums=('SKIP')

_extuuid=allowlockedremotedesktop@kamens.us

pkgver() {
    cd "$_pkgname"
    # There are no tags in the repo, so we come up with our own version format
    git log -1 --format="%cs-g%h" | sed 's/-/./g'
}

package() {
    mkdir -p "$pkgdir"/usr/share/gnome-shell/extensions/$_extuuid
    for f in COPYING README.md extension.js metadata.json; do
        install -m644 "$_pkgname"/$f "$pkgdir"/usr/share/gnome-shell/extensions/$_extuuid/$f
    done
}
