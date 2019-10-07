# Maintainer : Nover <nicolas.guilloux@protonmail.com>
# Heavily inspired by https://aur.archlinux.org/packages/uget-integrator-browsers/

pkgbase=kget-integrator-browsers
pkgname=(kget-integrator-chrome kget-integrator-chromium kget-integrator-opera kget-integrator-firefox)
arch=('any')
url="https://github.com/NicolasGuilloux/KGet-Integrator"
license=('GPL3')
depends=('kget-integrator')
pkgver=1.1.1
pkgrel=1
makedepends=()
source=("kget-chrome-$pkgver::https://raw.githubusercontent.com/NicolasGuilloux/KGet-Integrator/v$pkgver/Conf/com.kgetdm.chrome.json"
        "kget-firefox-$pkgver::https://raw.githubusercontent.com/NicolasGuilloux/KGet-Integrator/v$pkgver/Conf/com.kgetdm.firefox.json")
md5sums=('4029bede327a730ad3cbdeca07426eb1'
         'a3f781f4d06312c4aae24bbf0d6de1e4')

build() {
    cd "$srcdir"
}

#for Google Chrome
package_kget-integrator-chrome(){
    optdepends=('google-chrome: the browser')
    pkgdesc="Configuration to connect Google Chrome with kget-integrator"
    # install="chrome.install"
    cd "$srcdir"
    mkdir -p "$pkgdir/etc/opt/chrome/native-messaging-hosts"
    install -m644 "kget-chrome-$pkgver" "$pkgdir"/etc/opt/chrome/native-messaging-hosts/com.kgetdm.chrome.json
}

#for Chromium and Vivaldi
package_kget-integrator-chromium(){
    optdepends=('chromium: the browser')
    pkgdesc="Configuration to connect Chromium with kget-integrator"
    # install="chrome.install"
    cd "$srcdir"
    mkdir -p "$pkgdir/etc/chromium/native-messaging-hosts"
    install -m644 "kget-chrome-$pkgver" "$pkgdir"/etc/chromium/native-messaging-hosts/com.kgetdm.chrome.json
}

#for Opera
package_kget-integrator-opera(){
    optdepends=('opera-beta: the browser beta version' 'opera-developer: the browser developer version')
    pkgdesc="Configuration to connect Opera with kget-integrator"
    # install="opera.install"
    cd "$srcdir"
    mkdir -p "$pkgdir/etc/opera/native-messaging-hosts"
    install -m644 "kget-chrome-$pkgver" "$pkgdir"/etc/opera/native-messaging-hosts/com.kgetdm.chrome.json
}

#for Firefox
package_kget-integrator-firefox(){
    optdepends=('firefox: the browser')
    pkgdesc="Configuration to connect Firefox with kget-integrator"
    # install="firefox.install"
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/lib/mozilla/native-messaging-hosts"
    install -m644 "kget-firefox-$pkgver" "$pkgdir"/usr/lib/mozilla/native-messaging-hosts/com.kgetdm.firefox.json

    echo "You will need to install the extension from the following link, and restart your browser:"
    echo "https://addons.mozilla.org/fr/firefox/addon/kget-integration/"
}