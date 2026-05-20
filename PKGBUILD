# Maintainer: MythEclipse <2586ozan@gmail.com>

pkgname=antigravity-hub-bin
_pkgname=antigravity
pkgver=2.0.1
_execution_id=6566078776737792
pkgrel=1
pkgdesc='An agentic development platform from Google, evolving the IDE into the agent-first era. (Prebuilt binary from Google Cloud Storage)'
arch=(aarch64 x86_64)
url='https://antigravity.google/'
license=(LicenseRef-Google-Antigravity)
depends=(alsa-lib
         at-spi2-core
         bash
         cairo
         curl
         dbus
         expat
         glib2
         glibc
         gtk3
         libcups
         libgcc
         libsecret
         libsoup3
         libstdc++
         libx11
         libxcb
         libxcomposite
         libxdamage
         libxext
         libxfixes
         libxkbcommon
         libxkbfile
         libxrandr
         mesa
         nspr
         nss
         openssl
         pango
         systemd-libs
         util-linux-libs
         webkit2gtk-4.1)
provides=($_pkgname)
conflicts=($_pkgname $_pkgname-bin antigravity-appimage-bin antigravity-ide)
options=(!strip !debug)
install=$_pkgname.install
source=($_pkgname.sh
        $_pkgname.desktop
        $_pkgname-url-handler.desktop
        $_pkgname.appdata.xml
        $_pkgname-workspace.xml
        $_pkgname.png
        $_pkgname
        _$_pkgname
        LICENSE)
source_x86_64=("Antigravity-$pkgver-x86_64.tar.gz::https://storage.googleapis.com/antigravity-public/antigravity-hub/${pkgver}-${_execution_id}/linux-x64/Antigravity.tar.gz")
source_aarch64=("Antigravity-$pkgver-aarch64.tar.gz::https://storage.googleapis.com/antigravity-public/antigravity-hub/${pkgver}-${_execution_id}/linux-arm/Antigravity.tar.gz")

sha256sums=('c28be492822dd01d16d68e10aa6bb5d8bb1167f2aeceb9fe28b12d5e2ddc03b6'
            'a2b5800772fd2e22f001430fa9426576076d23978d369a493fbc92ad55868780'
            'e389958a24de86678a4b9697395d1535ed4aba9b527c791d1308884b68125d7d'
            '4f3c143c943c8658ea201e2f36faad41bccabc21743ffaa04b17e14959c5cfdd'
            '4e7352fe0c25b785ceda828c5ac0730ed0a961c268821f2a22cfae0e63a2236e'
            '152a2af02c87334401a77ecc150db035bff7071ac3114fbce70ba944f02b0b19'
            '2a884519d2f67f089861444c537fb3a1673e0c78854e9484d0b9c77ed708a425'
            '2898f305c7794d1e779dcebbf25d77c85275343f4f25cbb33404ef447eb9a2f2'
            '7056c04df17a4e0f0bac9f787f347c9cd892cee6323d1c89528090afd0b934a3')
sha256sums_aarch64=('5af56cc9dda954f369a61045b7da2f348bcb0b3507d272b4c0e9aa7cd6175d9b')
sha256sums_x86_64=('0727e1f56961b6d2347941f278da69cc6c17de3befe988524848cd167380e9ab')

package() {
    local _srcdir
    if [ "$CARCH" = "x86_64" ]; then
        _srcdir="Antigravity-x64"
    else
        _srcdir="Antigravity-arm64"
    fi

    install -d "$pkgdir/opt/Antigravity"
    install -d "$pkgdir/usr/share/licenses/$pkgname"

    cp -a "$srcdir/$_srcdir/"* "$pkgdir/opt/Antigravity/"

    ln -s /opt/Antigravity/resources/app/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    ln -s /opt/Antigravity/LICENSES.chromium.html "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"

    install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$srcdir/$_pkgname-url-handler.desktop" "$pkgdir/usr/share/applications/$_pkgname-url-handler.desktop"
    install -Dm644 "$srcdir/$_pkgname.appdata.xml" "$pkgdir/usr/share/metainfo/$_pkgname.appdata.xml"
    install -Dm644 "$srcdir/$_pkgname-workspace.xml" "$pkgdir/usr/share/mime/packages/$_pkgname-workspace.xml"
    install -Dm644 "$srcdir/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

    install -Dm644 "$srcdir/$_pkgname" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm644 "$srcdir/_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.gpl"
}
