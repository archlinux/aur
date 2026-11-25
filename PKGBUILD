# Maintainer: nahdd123 <nahdd123@gmail.com>
pkgname=copilot-desktop-gtk-bin
_name=copilot-desktop-gtk
pkgver=0.1.22
pkgrel=2
pkgdesc='Unofficial Microsoft Copilot desktop app (GTK4/WebKitGTK, prebuilt binary)'
arch=('x86_64')
url='https://github.com/sirredbeard/copilot-desktop-gtk'
license=('MIT')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0' 'libsoup3' 'glib2' 'cairo' 'pango'
         'gdk-pixbuf2' 'graphene' 'harfbuzz' 'hicolor-icon-theme')
optdepends=('libayatana-appindicator: tray icon support')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip' '!debug')
source=("https://github.com/sirredbeard/copilot-desktop-gtk/releases/download/v0.1.22/copilot-desktop-gtk-x86_64"
        "https://raw.githubusercontent.com/sirredbeard/copilot-desktop-gtk/v0.1.22/LICENSE"
        "https://raw.githubusercontent.com/sirredbeard/copilot-desktop-gtk/v0.1.22/NOTICE"
        "https://raw.githubusercontent.com/sirredbeard/copilot-desktop-gtk/v0.1.22/assets/desktop/copilot-desktop-gtk.desktop"
        "https://raw.githubusercontent.com/sirredbeard/copilot-desktop-gtk/v0.1.22/assets/desktop/copilot-desktop-gtk-autostart.desktop"
        "https://raw.githubusercontent.com/sirredbeard/copilot-desktop-gtk/v0.1.22/assets/desktop/copilot-desktop-gtk-daemon.desktop"
        "https://raw.githubusercontent.com/sirredbeard/copilot-desktop-gtk/v0.1.22/assets/metainfo/com.github.sirredbeard.copilot-desktop-gtk.metainfo.xml"
        "https://raw.githubusercontent.com/sirredbeard/copilot-desktop-gtk/v0.1.22/assets/icons/copilot-512.png"
)
sha512sums=('6510c9f2a442e3c754bf124c45cfcf03e63fe7705b5d71762506924363c46b0164249296a901c22554f65b5a5fd95e1cf75880618869bbdb90a8701b2986ce7e'
            '2c4a6ac5ba20e38f112bbe45db3f0f0aeece5538026c9250000ca1a5482af429972a92589dd38b6d8104948ea289fecd5f7243a2670ea245a4af550364a3734b'
            '96cbabc1b42b7d3e0161e6e921dbbd4024288874e3377ab950e842ea7688c26cd5127dfa02870acd2843605afa6db1058e914f43ab69f3e960ce0d6c09f33f08'
            '27bfc2a448ca9d4a3a877e5ae0eaaa7bb8bd3f98ed8a32d99e6ff71a39274dc95a96db85b75ce392c8ff2a4cdac7e0a6ccb4c285d58f8ef78047d32d5683f203'
            'df8a2d7807133a5981c043db162c3ccae01855c3b3de6706a7b37d41dadc7e7e0a4a4b3240f8ac6659e6cd1e1fe9d1c1dedc8ceb0dbb0cf5fe4d273b1e21e0b5'
            '9aa029a0e944d74227d31b132349cfb15185ea827d167fa06dd1126c153a23d2540882afa43118fd6ee5bbf1aaa662f6fa51a19c9a177ecd3c864adba1e29301'
            '93c4a101a2910e79930285283f4b4c53817178c798519661952def330671e6b27fa65fa465446dcdff291d94a5ea09cf3678bdfed504e10439912a2a76daca2e'
            '5de31207ca18c071ad6e9fa920073642768e4d36706d46e5630ced6b51f8def2d77b93fa2678b409cb9b5277145114eb1a265b0a6cb110d9bd51614005bfa4a9'
)

package() {
  # Native AOT single-file binary: no bundled runtime, GTK/WebKit come from depends
  install -Dm755 "${srcdir}/${_name}-x86_64" "${pkgdir}/usr/bin/${_name}"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/NOTICE" "${pkgdir}/usr/share/doc/${pkgname}/NOTICE"

  # AppStream requires the metainfo filename to match the reverse-DNS app ID
  install -Dm644 "${srcdir}/com.github.sirredbeard.copilot-desktop-gtk.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/com.github.sirredbeard.copilot-desktop-gtk.metainfo.xml"

  install -Dm644 "${srcdir}/copilot-desktop-gtk.desktop" \
    "${pkgdir}/usr/share/applications/copilot-desktop-gtk.desktop"
  install -Dm644 "${srcdir}/copilot-desktop-gtk-autostart.desktop" \
    "${pkgdir}/etc/xdg/autostart/copilot-desktop-gtk.desktop"
  # helper entry: private to the package, not exported to app launchers
  install -Dm644 "${srcdir}/copilot-desktop-gtk-daemon.desktop" \
    "${pkgdir}/usr/share/${_name}/copilot-desktop-gtk-daemon.desktop"

  install -Dm644 "${srcdir}/copilot-512.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_name}.png"
}
