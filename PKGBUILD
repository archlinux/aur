# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot+org>

pkgname=mapton
pkgver=0.8.0
pkgrel=2
pkgdesc="Some kind of map application"
arch=(any)
url="https://mapton.org"
license=('Apache')
source=("$url/files/$pkgname-$pkgver-SNAPSHOT.zip"
        mapton.desktop)
sha256sums=('dc5dd79257768765bc7b28a3cf3084d78a94f797c7f1defeecde1c3bb264abfc'
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

