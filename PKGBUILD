# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot+org>

pkgname=mapton
pkgver=0.8.0
pkgrel=1
pkgdesc="Some kind of map application"
arch=(any)
url="https://mapton.org"
license=('AGPL')
source=("$url/files/$pkgname-$pkgver-SNAPSHOT.zip"
        mapton.desktop)
sha256sums=('3ef19131c01fba6d08ceb79ad468aaaf936607ac7b739acc9480917201b753ff'
            'a51a83f390dc75fd8164f94954dc2a28fa7efe8e2274c9ded45412a2bc2bd169')

package() {
	depends=('java-runtime>=8' 'java-openjfx')

	# Initial target directories
	install -d $pkgdir/opt/mapton $pkgdir/usr/bin

	# Majority of files, ensure file permissions are correct
	cp -r mapton/{etc,extra,mapton,platform} $pkgdir/opt/mapton
	rm -f $pkgdir/opt/mapton/bin/*.exe
	chmod -R u=rwX,go=rX $pkgdir/opt

	# Executables and launchers
	install -D mapton/bin/mapton $pkgdir/opt/mapton/bin/mapton
	ln -s /opt/mapton/bin/mapton $pkgdir/usr/bin/mapton
	install -D mapton.desktop $pkgdir/usr/share/applications/mapton.desktop
}

