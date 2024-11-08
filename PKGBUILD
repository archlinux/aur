#Maintainer: Noble Eugene <nobleeugene2005@gmail.com>
pkgname="tinyupnp-git"
pkgver="0.1"
pkgrel=1
pkgdesc="Simple, small Zero Config UPnP Media Server"
arch=("x86_64")
makedepends=("scons" "gcc")
url="https://www.github.com/eugenenoble2005/tinyupnp"
source=("git+https://github.com/eugenenoble2005/tinyupnp")
sha256sums=("SKIP")

prepare(){
	cd $srcdir/tinyupnp
	git submodule init
	git submodule update --remote
}

package(){
 	cd $srcdir/tinyupnp/extern/platinum
	#pull Neptune runtime
 	git submodule init
 	git submodule update

	#checkout to tinyupnp branch
	git checkout tinyupnp
 	#build
 	scons

 	cd $srcdir/tinyupnp/extern/platinum/dist
 	chmod +x ./tinyupnp
	install -d -m 755 "$pkgdir/usr/bin"
 	cp tinyupnp "$pkgdir/usr/bin"
}
