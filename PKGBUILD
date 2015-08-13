# Maintainer: spider-mario <spidermario@free.fr>
pkgname=vocoder-jack
pkgver=0.29
pkgrel=1
pkgdesc="Standalone JACK vocoder"
arch=('i686' 'x86_64')
url="http://www.sirlab.de/linux/download_vocoder_standalone_jack.html"
license=('GPL')
depends=('fltk' 'jack' 'libsndfile')
source=(http://www.sirlab.de/linux/download/$pkgname-$pkgver.tar.gz
        include-unistd.patch
        build.patch)
noextract=()
sha512sums=('46f77069be5f30810cf69a5e058370df0d20c2de9ff64a5311ec36c87fad786d0b306f84378458655e9aa5a118e731a0a18a42e9c61485d8a2724b1b92950df8'
            'a4ff280cd71ab942723c82e53b6aab1af424ea2946e902e6732d4c3e8c6466fd65c08cdad9851d9238a4b9b5ca9b59710369b4d63999a70ee55bb83c4dc3fbca'
            'a6e2757e58640f39ae81c4ed6926a4ec50490a609642490a40c4491122d2ddb6459289759d03eee7ed2b931d35807630dbecdd67cd56af5472517925144c74cd')

prepare() {
	cd vocoder
	patch -p1 < ../include-unistd.patch
	patch -p1 < ../build.patch
}

build() {
	cd vocoder
	make
}

package() {
	cd vocoder

	install --directory "$pkgdir"/usr/bin
	install src/vocoder "$pkgdir"/usr/bin/
	install util/play_loop "$pkgdir"/usr/bin/
}
