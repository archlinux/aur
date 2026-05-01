# Note: After installation must me enabled service 'sudo systemctl enable --now vpnagentd.service'
pkgname=cisco-secure-client
pkgver=5.1.16.194
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
    "https://git.ufz.de/howto/linux/vpn-setup/-/raw/update_5.1.16.194/cisco-secure-client-linux64-${pkgver}-predeploy-deb-k9.tgz"
)

sha256sums=('9b5d6b731a88f84b0c50da7d4d8afc9da6d874fc54504701ef5a49b321d03aa3')

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