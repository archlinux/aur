# Maintainer: Alexandr Boiko <4le34n at gmail dot com>

pkgname=accel-ppp-vlanmon-dkms-git
_pkgname=accel-ppp
pkgver=1.12.0_57_gc983d6f
pkgrel=1
pkgdesc='Accel-ppp vlan_mon kernel module sources'
arch=('i686' 'x86_64')
url="https://github.com/accel-ppp/accel-ppp"
license=('GPL')
depends=('dkms' 'lua51')
source=("accel-ppp::git+$url"
        'dkms.conf')

pkgver() {
    cd "$srcdir/${_pkgname%-git}"
    printf "%s" "$(git describe --tags | sed 'y/-/_/')"
}
package() {
    cd "$srcdir/${_pkgname%-git}"
    install -dm755 "$pkgdir/usr/src"
    cd drivers
    cp -r vlan_mon "$pkgdir/usr/src/accel-ppp-vlanmon-$pkgver"
    # Copy dkms.conf
    install -Dm0644 "$srcdir/dkms.conf" "$pkgdir/usr/src/accel-ppp-vlanmon-$pkgver/dkms.conf"
    # Set name and version
    sed -e "s/@PKGNAME@/${pkgname}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/accel-ppp-vlanmon-${pkgver}/dkms.conf
}

md5sums=('SKIP'
         'ecb9e73f9243d773949cab8f2de36fc9')
