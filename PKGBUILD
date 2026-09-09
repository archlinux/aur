# Maintainer: justbispo <aur.fyxy0@slmail.me>
pkgname=(
    vencord-bin
    chromium-vencord-bin
    firefox-vencord-bin
    firefox-developer-edition-vencord-bin
    librewolf-vencord-bin
)
pkgbase=vencord-bin
_zipdirname=builds
_dirname=vencord
pkgver=1.15.5
pkgrel=1
pkgdesc="The cutest Discord client mod"
arch=(any)
url=https://vencord.dev
_ghurl="https://github.com/Vencord/builds"
license=(GPL3)
makedepends=(
    unzip
)
_commit_sha="3adbdc6191354b366a2f2aa1d058d7355c01da77"
source=("${pkgname}"-"${pkgver}".zip::"$_ghurl"/archive/"$_commit_sha".zip)
sha256sums=('41718098a5d7e938448e47e1e83dc607b12b07adfe6bb81b5e3a8fb2b1bbf5eb')

package_vencord-bin() {
    pkgdesc+=" (replaces Vesktop's built-in Vencord)"
    depends=(vesktop)
    provides=(vencord)
    conflicts=(vencord)
    install=vencord.install

    cd "$srcdir"/${_zipdirname}-${_commit_sha}
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_dirname/LICENSE
    install -d "$pkgdir"/usr/lib/$_dirname
    cp -r -- vencord* preload* patcher* renderer* "$pkgdir"/usr/lib/$_dirname
    echo '{}' >>"$pkgdir"/usr/lib/$_dirname/package.json
}

package_chromium-vencord-bin() {
    pkgdesc+=' (unpacked webextension)'
    optdepends=(chromium vivaldi google-chrome opera brave ungoogled-chromium)
    provides=(chromium-vencord)
    conflicts=(chromium-vencord)
    install=vencord.install

    cd "$srcdir"/${_zipdirname}-${_commit_sha}
    unzip extension-chrome.zip -d extension-chrome
    install -dm755 "$pkgdir"/usr/lib/"$_dirname"-chromium
    cp -r -- extension-chrome/* "$pkgdir"/usr/lib/"$_dirname"-chromium
}

package_firefox-vencord-bin() {
    depends=(firefox)
    provides=(firefox-vencord)
    conflicts=(firefox-vencord)
    install=vencord.install

    cd "$srcdir"/${_zipdirname}-${_commit_sha}
    install -Dm644 extension-firefox.zip "$pkgdir"/usr/lib/firefox/browser/extensions/vencord-firefox@vendicated.dev.xpi
}

package_firefox-developer-edition-vencord-bin() {
    depends=(firefox-developer-edition)
    provides=(firefox-developer-edition-vencord)
    conflicts=(firefox-developer-edition-vencord)
    install=vencord.install

    cd "$srcdir"/${_zipdirname}-${_commit_sha}
    install -Dm644 extension-firefox.zip "$pkgdir"/usr/lib/firefox-developer-edition/browser/extensions/vencord-firefox@vendicated.dev.xpi
}

package_librewolf-vencord-bin() {
    depends=(librewolf)
    provides=(librewolf-vencord)
    conflicts=(librewolf-vencord)
    install=vencord.install

    cd "$srcdir"/${_zipdirname}-${_commit_sha}
    install -Dm644 extension-firefox.zip "$pkgdir"/usr/lib/librewolf/browser/extensions/vencord-firefox@vendicated.dev.xpi
}
