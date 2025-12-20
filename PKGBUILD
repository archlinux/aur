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
pkgver=1.13.11
pkgrel=1
pkgdesc="The cutest Discord client mod"
arch=(any)
url=https://vencord.dev
_ghurl="https://github.com/Vencord/builds"
license=(GPL3)
makedepends=(
    unzip
)
_commit_sha="4deb7873b860474524a6eba6eb25437b39ea68d2"
source=("${pkgname}"-"${pkgver}".zip::"$_ghurl"/archive/"$_commit_sha".zip)
sha256sums=('cad1266f06ee169eabab657e62f669b1267f2ed3dcad0e72528ef897c01b53ed')

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
