# Maintainer: Lucy Poulton <lucy@poulton.xyz> 
pkgname=splatnet2statink
pkgver=v1.5.8
pkgrel=1
pkgdesc='Takes battle data from the SplatNet 2 app and uploads it to stat.ink'
arch=('any')
url="https://github.com/frozenpandaman/${pkgname}"
license=('GPL3')
depends=('python-requests' 'python-msgpack' 'python-future' 'python-pillow')
conflicts=("${pkgname}")
provides=("${pkgname}")
source=('git+https://github.com/frozenpandaman/splatnet2statink.git' 'launch.sh' 'config-in-homedir.patch')
md5sums=('SKIP' '4a5418f3eb14681ce68671eb38a9c772' '685e1cad443c0ffbf3cddd0b1e31e4b4')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | tr "-" "_"
}

build() {
	cd "$srcdir/$pkgname"
	git apply ../config-in-homedir.patch
}

package() {
	cd $srcdir/$pkgname
	install -D -t "$pkgdir/opt/$pkgname" "$pkgname.py" "salmonrun.py" "iksm.py" "dbs.py"
	install -D "$srcdir/launch.sh" "$pkgdir/usr/bin/splatnet2statink"
}
