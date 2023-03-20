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
source=("linphone-$pkgver.AppImage::https://download.linphone.org/releases/linux/app/Linphone-5.0.14.AppImage"
        "linphone.png::https://gitlab.linphone.org/BC/public/linphone-desktop/-/raw/8dfd384e3df08b200c8eb382b740da6839961bf0/linphone-app/assets/icons/hicolor/128x128/apps/icon.png")
sha512sums=('fbe57bf0d137afc2a59e5b245bc51b23777316e2f65db254732741e72a23fa053cc0438bc5c08f7e6eed1f144f845deeb1de322d65343ebb5653896764f0f950'
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
