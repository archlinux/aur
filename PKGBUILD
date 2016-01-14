# Maintainer: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>

pkgname=gitkraken
pkgrel=2
pkgver=0.5.0
pkgdesc="The intuitive, fast, and beautiful cross-platform Git client."
url="http://www.gitkraken.com/"
provides=('gitkraken')
arch=('x86_64')
license=('custom')
depends=('gtk2' 'nss' 'libnotify' 'libxtst' 'libgnome-keyring' 'gconf' 'alsa-lib')
makedepends=()
backup=()
install=''
source=(
	"https://release.gitkraken.com/linux/gitkraken-amd64.tar.gz"
	"GitKraken.desktop"
	"gitkraken.png"
	"eula.html"
)
md5sums=('201438725b433c49d61a6635ddf7a82b'
         '765148843d302e15d80ddd0041efc957'
         'fcac914c0044d1e5831ce46b88c37ec5'
         'e9ba6663e5f1f92cae31beb0074e8c6c')

package() {
	install -d "$pkgdir"/opt
	cp -R "$srcdir"/GitKraken "$pkgdir"/opt/gitkraken

	find "$pkgdir"/opt/gitkraken/ -type f -exec chmod 644 {} \;
	chmod 755 "$pkgdir"/opt/gitkraken/gitkraken

	install -d "$pkgdir"/usr/bin
	ln -s ../../opt/gitkraken/gitkraken "$pkgdir"/usr/bin/gitkraken

	install -Dm644 "../eula.html" "$pkgdir"/usr/share/licenses/$pkgname/eula.html

	install -D -m644 "../GitKraken.desktop" "${pkgdir}/usr/share/applications/GitKraken.desktop"
  	install -D -m644 "../gitkraken.png"     "${pkgdir}/usr/share/pixmaps/gitkraken.png"
}
