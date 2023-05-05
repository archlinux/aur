# Maintainer: Witalij Berdinskikh <radio_rogal@posteo.pl>

pkgname=intellij-http-client
pkgver=231.8770.17
pkgrel=4
pkgdesc="IntelliJ HTTP Client: run HTTP requests from a terminal. The binary is called ijhttp."
arch=("any")
url="https://www.jetbrains.com/help/idea/http-client-cli.html"
license=('custom')
depends=('java-runtime>=17')
source=("https://download.jetbrains.com/resources/intellij/http-client/${pkgver}/${pkgname}.zip"
         ${pkgname} jdk-ge-17.patch)
md5sums=('b36f2b8e061f8fbc91101b54cb2337bc'
         'fa8ad5f9aab6360df42a1a1b95b46d7a'
         '20d3cf451bcd33a245a957bfbbec9b50')
sha256sums=('eb0090f87b6a28172ced9e8a34cc14a9a3b2aae142752f1e31392f58b102db06'
            '63fbb486be26fcff665fd5c22d29f3c3c629032aff1afcf834341737dd2461de'
            '938214dc5b40b1c235663d76508b5f0b3c11d876ef69f22ec4fb49a8e22cb8a1')

build() {
	patch -p0 < jdk-ge-17.patch
}

package() {
	install -Dm644 ijhttp/{License.txt,third-party-libraries.html} -t "${pkgdir}"/usr/share/licenses/${pkgname}
	install -D ijhttp/ijhttp -t "${pkgdir}"/usr/share/java/${pkgname}
	cp -r ijhttp/lib "${pkgdir}"/usr/share/java/${pkgname}
	install -D ${pkgname} "${pkgdir}"/usr/bin/ijhttp
}
