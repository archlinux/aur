pkgname=sunflower-git
_gitname=Sunflower
pkgver=0.2.59
pkgrel=0
pkgdesc="Small and highly customizable twin-panel file manager for Linux with support for plugins"
arch=('any')
url="https://github.com/MeanEYE/Sunflower"
license=('GPL3')
depends=('pygtk' 'librsvg')
makedepends=('git')
optdepends=('python2-notify' 'vte')
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
