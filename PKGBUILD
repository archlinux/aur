# Maintainer: TurboRigby from Rigby Foundation <levdmytriev@gmail.com>

pkgname=nuggetvpn-bin
_pkgname=nuggetvpn
pkgver=0.3.1
pkgrel=4
pkgdesc="Modern, lightweight, and fast VPN client built with Tauri v2 and React 19 (Binary release)"
arch=('x86_64')
url="https://github.com/Rigby-Foundation/nuggetvpn"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl' 'glibc')
options=('!strip')

source_x86_64=("NuggetVPN_${pkgver}_amd64.deb::https://github.com/Rigby-Foundation/nuggetvpn/releases/download/v${pkgver}/NuggetVPN_${pkgver}_amd64.deb")
sha256sums_x86_64=('c5112d7929820bdd3c3fd8e1f81ad42e9e670f543911a54108bb05492856f08d')

package() {
    bsdtar -O -xf "$srcdir/NuggetVPN_${pkgver}_amd64.deb" data.tar* | bsdtar -C "$pkgdir" -x

    if [ -f "$pkgdir/usr/bin/${_pkgname}" ]; then
        chmod 755 "$pkgdir/usr/bin/${_pkgname}"
    fi

    install -dm755 "$pkgdir/usr/share/applications"
    cat <<EOF > "$pkgdir/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Type=Application
Version=0.3.1
Name=NuggetVPN
Comment=${pkgdesc}
Exec=env WEBKIT_DISABLE_COMPOSITING_MODE=1 /usr/bin/${_pkgname} %U
Icon=${_pkgname}
Terminal=false
Categories=Network;VPN;GTK;
StartupNotify=true
EOF
    chmod 644 "$pkgdir/usr/share/applications/${_pkgname}.desktop"
}
