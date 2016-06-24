pkgname=sunflower-git
_gitname=Sunflower
pkgver=0.3
pkgrel=1
pkgdesc="Small and highly customizable twin-panel file manager for Linux with support for plugins"
arch=('any')
url="https://github.com/MeanEYE/Sunflower"
license=('GPL3')
depends=('desktop-file-utils' 'pygtk' 'python2-chardet' 'librsvg')
makedepends=('git')
optdepends=('python2-gnomekeyring: password storage for remote mounts'
'python2-notify: desktop notifications service'
'vte: integrated vte-based terminal'
'mutagen: audio-metadata support'
'gvfs: mount-management'
'python2-dbus: single application instance support') 
conflicts=('sunflower')
source=('git://github.com/MeanEYE/Sunflower.git'
'sunflower.desktop')
md5sums=('SKIP'
         '9cfbe8c2075b39b9d62242ef48598105')
pkgver() {
	cd "${srcdir}/${_gitname}"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	mkdir -p $pkgdir/{opt,usr/bin}
	cp -a $srcdir/Sunflower $pkgdir/opt/sunflower
	echo -e '#!/bin/sh\npython2 /opt/sunflower/Sunflower.py "$@"' > $pkgdir/usr/bin/sunflower
	chmod +x $pkgdir/usr/bin/sunflower
	mkdir -p $pkgdir/usr/share/applications
	cp sunflower.desktop $pkgdir/usr/share/applications/
}
