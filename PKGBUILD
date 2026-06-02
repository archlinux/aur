# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=apkeditor-bin
pkgver=1.4.9
pkgrel=1
pkgdesc='Powerful Android APK editor, aapt/aapt2 independent (prebuilt jar)'
arch=('any')
url='https://github.com/REAndroid/APKEditor'
license=('Apache-2.0')
depends=('java-runtime')
provides=("apkeditor=${pkgver}")
conflicts=('apkeditor')
options=('!strip' '!debug')
source=("APKEditor-${pkgver}.jar::${url}/releases/download/V${pkgver}/APKEditor-${pkgver}.jar")
sha256sums=('a9cd40df818845456be6d696de6110c89edf4b0a0580cb83438ed6b25a366e67')

latestver() {
    gh api repos/REAndroid/APKEditor/releases/latest --jq '.tag_name' | sed 's/^[Vv]//'
}

package() {
    install -Dm644 "APKEditor-${pkgver}.jar" "$pkgdir/usr/share/java/apkeditor/APKEditor.jar"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/apkeditor" <<'WRAPPER'
#!/bin/sh
exec java -jar /usr/share/java/apkeditor/APKEditor.jar "$@"
WRAPPER
}
