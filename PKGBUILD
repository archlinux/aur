# Maintainer: Witalij Berdinskikh <radio_rogal@posteo.pl>

pkgname=intellij-http-client
pkgver=231.9011.34
pkgrel=1
pkgdesc="IntelliJ HTTP Client: run HTTP requests from a terminal. The binary is called ijhttp."
arch=("any")
url="https://www.jetbrains.com/help/idea/http-client-cli.html"
license=('custom')
depends=('java-runtime>=17')
source=("https://download-cdn.jetbrains.com/resources/intellij/http-client/${pkgver}/${pkgname}.zip"
         ${pkgname} jdk-ge-17.patch)

build() {
	patch -p0 < jdk-ge-17.patch
}

package() {
	install -Dm644 ijhttp/{License.txt,third-party-libraries.html} -t "${pkgdir}"/usr/share/licenses/${pkgname}
	install -D ijhttp/ijhttp -t "${pkgdir}"/usr/share/java/${pkgname}
	cp -r ijhttp/lib "${pkgdir}"/usr/share/java/${pkgname}
	install -D ${pkgname} "${pkgdir}"/usr/bin/ijhttp
}

md5sums=('2aa9e5606e631bd9c62b7b99abe3deb5'
         'fa8ad5f9aab6360df42a1a1b95b46d7a'
         '20d3cf451bcd33a245a957bfbbec9b50')
sha256sums=('d3968160ef0f54adf6291a69371f8ae6717f0805b343cb0d3ffb37d4832ee22b'
            '63fbb486be26fcff665fd5c22d29f3c3c629032aff1afcf834341737dd2461de'
            '938214dc5b40b1c235663d76508b5f0b3c11d876ef69f22ec4fb49a8e22cb8a1')
