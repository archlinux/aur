# Note: After installation must me enabled service 'sudo systemctl enable --now vpnagentd.service'
pkgname=cisco-secure-client
pkgver=5.1.17.3394
pkgrel=1
pkgdesc='Cisco AnyConnect Secure Mobility Client'
url='https://www.cisco.com/site/us/en/products/security/secure-client/index.html'
arch=('x86_64')
depends=('libxml2-legacy' 'ca-certificates')
optdepends=(
    'hicolor-icon-theme: required by desktop shortcuts'
    'glib2: required by vpnui'
    'gtk3: required by vpnui'
    'webkit2gtk: required by acwebhelper'
)
conflicts=('cisco-anyconnect')
license=('custom')

# skip stripping the binaries to pass integrity check inside vpnagentd
options=('!strip')

source=(
    "https://archive.org/download/cisco-secure-client-linux64-${pkgver}/cisco-secure-client-linux64-${pkgver}-predeploy-deb-k9.tgz"
)

sha256sums=('5c4cafb4694e64cbf041481f5df3d70389399926f8aa2a469d480c0555b58c2c')

prepare() {
    cd "$srcdir"
    bsdtar -xf "cisco-secure-client-vpn_${pkgver}_amd64.deb"
}

package() {
    if [ -f "$srcdir"/data.tar.zst ]; then
        bsdtar -xf "$srcdir"/data.tar.zst -C "$pkgdir/"
    else
        bsdtar -xf "$srcdir"/data.tar.xz -C "$pkgdir/"
    fi

    mv -f "$pkgdir/lib" "$pkgdir/usr"
}