# Maintainer: adogecheems <adogecheems@outlook.com>
pkgname=monika-after-story
pkgver=0.12.17
pkgrel=2
pkgdesc="A mod for the free game Doki Doki Literature Club from Team Salvato, which builds on Act 3 to create a simulator of your eternal life with Monika."
arch=(
    'i686'
    'x86_64'
)
url="https://github.com/adogecheems/monika-after-story-linux"
license=('custom')
makedepends=('unzip')
optdepends=('polkit: for possible privilege escalation')
source=(
    "https://github.com/adogecheems/monika-after-story-linux/raw/refs/heads/main/resources/DDLC.tar.xz"
    "https://github.com/adogecheems/monika-after-story-linux/raw/refs/heads/main/resources/scripts.tar.xz"
    "https://github.com/adogecheems/monika-after-story-linux/raw/refs/heads/main/resources/mas.png"
    "https://github.com/Monika-After-Story/MonikaModDev/releases/download/v$pkgver/Monika_After_Story-$pkgver-Mod.zip"
    "mas.desktop"
)
sha256sums=(
    'd1d5f4dbc409f921c1f3b48e1c422da7ebf032916699517e0dd213127e2c4328'
    '1e4b6b1ae9d360ff46784ab01b4378af4049ee2330dbe78e35de510e3ca4ccbc'
    'a8416c26f4ee7e6afe18b6c6641bb2e4978b41731ef06712ab5066fdffd0d3ab'
    '6bc8e179f543c042a0bd0aaaa55815770d9f94b31e4bad8f1e0edaff71652803'
    '723c98ca0bc0f022a444c7a7cb225989ad2b2fbe364ead02c5b1c29d31a7abd4'
)
noextract=(
    "Monika_After_Story-$pkgver-Mod.zip"
    "scripts.tar.xz"
)
prepare() {
    unzip -o -q "$srcdir/Monika_After_Story-$pkgver-Mod.zip" -d "$srcdir/DDLC"
    
    tar -xf "$srcdir/scripts.tar.xz" -C "$srcdir/DDLC" --overwrite
    
    chmod +x "$srcdir/DDLC/DDLC.sh"
    chmod +x "$srcdir/DDLC/lib/linux-x86_64/DDLC"
    chmod +x "$srcdir/DDLC/lib/linux-i686/DDLC"
}
build () {
    cd "$srcdir/DDLC"
    ./DDLC.sh . compile
}
package() {
    install -Dm644 "$srcdir/mas.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/mas.png"
    install -Dm644 "$srcdir/mas.desktop" "$pkgdir/usr/share/applications/mas.desktop"
    
    install -d "$pkgdir/opt/monika-after-story"
    cp -a "$srcdir/DDLC/" "$pkgdir/opt/monika-after-story"
}
