# Maintainer: Your Name <your@email.com>
pkgname="goodaccess"
pkgver="4.7.2"
pkgrel="1"
pkgdesc="GoodAccess client for Linux (converted from .deb)"
arch=('x86_64')
url="https://goodaccess.com"
license=('custom')
depends=('glibc' 'libstdc++5')
source=("goodaccess_4.7.2-1_amd64.deb::https://link.goodaccess.com/download-linux-deb")
noextract=("goodaccess_4.7.2-1_amd64.deb")
sha256sums=('SKIP')

pkgver() {
    local ver=$(curl -sL "https://goodaccess-storage.b-cdn.net/applications/prod/linux/repos/deb/dists/stable/main/binary-amd64/Packages" | grep "^Version:" | head -n1 | cut -d' ' -f2)
    echo ${ver%-*}
}

package() {
    local deb_file="goodaccess_4.7.2-1_amd64.deb"
    local data_tar=$(ar t "${srcdir}/${deb_file}" | grep "^data.tar" | head -n1)
    bsdtar -O -xf "${srcdir}/${deb_file}" "$data_tar" | bsdtar -C "${pkgdir}" -xf -
}
