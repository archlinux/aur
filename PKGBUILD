# Maintainer: winner <aur.vn4ly@codecoffin.com>
pkgname='exploit-education-phoenix-bin'
pkgver=1.0.0
pkgrel=2
pkgdesc="Phoenix is a set of exploitable binaries."
arch=("x86_64")
url="https://github.com/ExploitEducation/Phoenix"
license=('none')
makedepends=('libarchive')
source=("phoenix-amd64.deb::https://github.com/ExploitEducation/Phoenix/releases/download/v1.0.0-alpha-3/exploit-education-phoenix_1.0.0-_amd64.deb")
noextract=("phoenix-amd64.deb")
md5sums=("69af41617ca188bf425c982a634918d1")
options=(!strip)

prepare() {
	bsdtar -xf "$srcdir/phoenix-amd64.deb" data.tar.bz2
	bsdtar -xf data.tar.bz2 opt/phoenix
}

package() {
	cd "opt/phoenix/"
	
	# Install binaries
	binaries=("final-one" 
		"final-two" "final-zero" 
		"format-four" "format-one" 
		"format-three" "format-two" 
		"format-zero" "heap-one" 
		"heap-three" "heap-two" 
		"heap-zero" "net-one" 
		"net-two" "net-zero" 
		"stack-five" "stack-four" 
		"stack-one" "stack-six" 
		"stack-three" "stack-two" 
		"stack-zero")
	for binary in ${binaries[@]}; do
		echo "Installing $binary"
		install -Dm755 "amd64/$binary" "$pkgdir/usr/bin/$binary"
	done

	# install libraries
	install -Dm755 "x86_64-linux-musl/lib/ld-musl-x86_64.so.1" "$pkgdir/opt/phoenix/x86_64-linux-musl/lib/ld-musl-x86_64.so.1"
	install -Dm755 "x86_64-linux-musl/lib/libc.so" "$pkgdir/opt/phoenix/x86_64-linux-musl/lib/libc.so"
}
