# Maintainer: LunarEclipse <luna@lunareclipse.zone>
pkgname=textern-native-messaging-host
pkgver=0.8
pkgrel=1
pkgdesc='Native Messaging Host for the Textern firefox addon.'
arch=('any')
url='https://github.com/jlebon/textern'
license=('GPL3')
depends=('python' 'python-inotify-simple')
install='textern.install'
source=(
    'textern'::"git+https://github.com/jlebon/textern.git#tag=v$pkgver"
)
b2sums=('SKIP')

build() {
    sed -e 's|@@NATIVE_PATH@@|/usr/lib/textern/textern.py|' "$srcdir/textern/native/textern.json.in" > "$srcdir/textern/native/textern.json"
}

package() {
    install -D "$srcdir/textern/native/textern.py" -t "$pkgdir/usr/lib/textern/"
    install -Dm644 "$srcdir/textern/native/textern.json" -t "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
}
