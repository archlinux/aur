# Maintainer: Timothy Heironimus <timothyheironimus6@gmail.com>
pkgname=tailsdvd-git
pkgver=git
pkgrel=1
#epoch=
pkgdesc="Simple iso creator and burner"
arch=(x86_64)
#url=UNKNOWN
url="https://github.com/tails1154/tailsdvd"
license=('GPL')
#groups=()
depends=(cdrtools tk python3)
source=("${pkgname}::git+https://github.com/tails1154/tailsdvd")
#noextract=()
#sha256sums=() # uhhh
#validpgpkeys=() # How do I even make these?
# Get ready for tails1154's garbage coding
prepare() {
	ls
	cd "$pkgname/src"
	ls
}

build() {
	# It's a python script, idk if we need to do anything
	# Let's just copy it to another file name lol
	cd "$pkgname/src"
	echo "$(pwd)"
	cp dvdburn.py $pkgname # Why did I name the file dvdburn
	# Make it executable
	chmod +rwx $pkgname # erm actually, you need to do $pkgname
}

package() {
	echo "$(pwd)"
	cd $pkgname/src
	install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" # Let's gooo GPL-3.0 license
	install -D $pkgname "$pkgdir/usr/local/bin/tailsdvd" # The actual python script
}
