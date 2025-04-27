# Maintainer: PaloMiku <palomiku@outlook.com>
pkgname=moekey-bin
pkgver=0.9.0+59
pkgrel=2
pkgdesc="MoeKey is a cross-platform misskey client made by Flutter."
arch=('x86_64')
url='https://github.com/MoeKeyDev/MoeKey'
license=('GPL3')
pkgver_url=$(printf '%s' "${pkgver}" | sed 's/+/%2B/g')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MoeKeyDev/MoeKey/releases/download/${pkgver_url}/MoeKey-${pkgver}-linux-x86_64-release.tar.gz"
        "icon.png")
sha256sums=('SKIP' 'SKIP')
depends=('libayatana-appindicator' 'xdg-user-dirs' 'webkit2gtk-4.1')

package() {
    install -d "${pkgdir}/opt/MoeKey" "${pkgdir}/usr/bin"

    bsdtar -xf "$srcdir/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/opt/MoeKey"

    ln -s /opt/MoeKey/MoeKey "${pkgdir}/usr/bin/MoeKey"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/MoeKey.desktop" <<EOF
#!/usr/bin/env xdg-open
[Desktop Entry]
Name=Moekey
Comment=MoeKey is a cross-platform misskey client made by Flutter.
Comment[zh_CN]=MoeKey 是基于 Flutter 的跨平台 misskey 客户端
Exec=MoeKey
Icon=io.github.Predidit.MoeKey
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
EOF

    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/io.github.Predidit.MoeKey.png"
}