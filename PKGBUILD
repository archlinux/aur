# Maintainer: Daniel Poellmann <aur@<lastname><firstname>.de>
# Contributor: David P. <megver83@parabola.nu>

pkgname=linphone-desktop
pkgver=5.0.14
pkgrel=1
pkgdesc='A free VoIP and video softphone based on the SIP protocol'
arch=(x86_64)
url='http://linphone.org'
license=(GPL)
depends=('libxcrypt-compat' 'fuse2')
makedepends=('gendesk')
source=("linphone-$pkgver.AppImage::https://download.linphone.org/releases/linux/app/Linphone-5.0.17.AppImage"
        "linphone.png::https://gitlab.linphone.org/BC/public/linphone-desktop/-/raw/8dfd384e3df08b200c8eb382b740da6839961bf0/linphone-app/assets/icons/hicolor/128x128/apps/icon.png")
sha512sums=('68d6a05974cc057ec62eb4fe8a138cfddc5f9977f9fb2a0917d7f5c3c5623a2b6b6f8cec478a4d18e82505ebce238ef0c555d6f50e068158dac7e6afad68348b'
            'd6495cdc022b1e4c92b3641cb70347e7e6b6ef47599004de729e908b4876a12540713ab54b588611c99c8025fb9b33e3392573c85c13f72cdaee8bcf7a73d65d')
options=(!strip)

build() {   
  cd "$srcdir/"
  gendesk -f -n \
     --pkgname=$pkgname \
     "--pkgdesc=$pkgdesc" \
     "--name=Linphone" \
     "--genericname=VoiP Client" \
     "--categories=Network" \
     "--icon=linphone.png" \
     --exec=/opt/linphone/linphone-$pkgver.AppImage \
     --terminal=false \
     --startupnotify=true
}

package() {
    mkdir -p "$pkgdir/opt/linphone/"
    install -Dm644 "$srcdir/linphone-$pkgver.AppImage" "$pkgdir/opt/linphone/linphone-$pkgver.AppImage"
    chmod +x "$pkgdir/opt/linphone/linphone-$pkgver.AppImage"

    mkdir -p "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/linphone-desktop.desktop" "$pkgdir/usr/share/applications/"

    mkdir -p "$pkgdir/usr/share/pixmaps/"
    install -Dm644 "$srcdir/linphone.png" "$pkgdir/usr/share/pixmaps/"
}
