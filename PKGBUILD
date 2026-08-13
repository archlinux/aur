# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Maintainer: Manuel Barrio Linares <mbarriolinares at gmail dot com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=antigravity-ide
pkgver=2.5.5
pkgrel=1
pkgdesc='An agentic development platform from Google, evolving the IDE into the agent-first era'
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
conflicts=('antigravity<2.0')
options=(!strip !debug)
install=$pkgname.install
source=(antigravity-ide.sh
        antigravity-ide.desktop
        antigravity-ide-url-handler.desktop
        antigravity-ide.appdata.xml
        antigravity-ide-workspace.xml)
_build=4923483625488384
source_x86_64=($pkgname-$pkgver-x86_64.tar.gz::https://dl.google.com/release2/j0qc3/antigravity/stable/$pkgver-$_build/linux-x64/Antigravity%20IDE.tar.gz)
source_aarch64=($pkgname-$pkgver-aarch64.tar.gz::https://dl.google.com/release2/j0qc3/antigravity/stable/$pkgver-$_build/linux-arm/Antigravity%20IDE.tar.gz)
b2sums=('20a33a75e654ffb6535cd415d52b06559cb681da84eace78702fea50d5362ad23b478c8308bd4b7c48820d8a01c84b5643e754f561e0afa843a5495a694ca86e'
        '5047eb55fc8d0a9288c852ddb6fb32cb41915d97d600d3e40c8b52dbbb0efa6ffb173439a2511b44d39b539655f3f2f0bd569da95023da2373e29da69f68be5f'
        'ccd8e86e6acc9e542428377b3fadc743b8b2e7d59e6aa96c9aa21a8b743af9532aefdfdab062bb296515bdf0752e2b3208b888869bae4a55b4ddd07652d5f37f'
        '8d082784596cfe67fe48e409d780ae03f6e6c9aa999412d9b2a47bfcdb6357a08a5abf9c4fd90e2c49df5ecbd98c179c43a6bcc38e477aace24f4ba23a481a6c'
        'f6ed182fbf1463a24dc5545c71d7924b1e9b7c9832d25bfe09974a63c72385dfecbe0b609a492717348178ba6b61601f4ccea53d3f2942dd330567da40be6e95')
b2sums_aarch64=('09e5454f9793c536eeb9d3b10a7a08203caada8046f6c04f7b470509bcfd99337a134c07d682459af31920028e87446860d3d2e23b1c25e554114948832fcadd')
b2sums_x86_64=('c016152db0e08f3c49ee353481135c4285ac9f837da295021600464a41b7ee054d5e72ba0e1462d1c26e6bab0b06e1dcf6346f8df015acf2f1dc24ed03e65264')

package() {
    install -d "$pkgdir/opt"
    cp -a "Antigravity IDE" "$pkgdir/opt/antigravity-ide"
    rm -r "$pkgdir/opt/antigravity-ide/resources/completions"

    install -Dm755 antigravity-ide.sh "$pkgdir/usr/bin/$pkgname"

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /opt/antigravity-ide/resources/app/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /opt/antigravity-ide/LICENSES.chromium.html -t "$pkgdir/usr/share/licenses/$pkgname"

    install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 $pkgname-url-handler.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 $pkgname.appdata.xml -t "$pkgdir/usr/share/metainfo"
    install -Dm644 $pkgname-workspace.xml -t "$pkgdir/usr/share/mime/packages"

    cd "Antigravity IDE"
    install -Dm644 resources/completions/bash/$pkgname -t "$pkgdir/usr/share/bash-completion/completions"
    install -Dm644 resources/completions/zsh/_$pkgname -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 resources/app/resources/linux/code.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
