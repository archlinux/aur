# Maintainer: Emma CHRISTOPHE <jean.michel.lesatanique@gmail.com>
pkgname=crcl-select
pkgver=1.1
pkgrel=4
pkgdesc="Circle selection utility with Eww widgets"
arch=('x86_64')
url="https://github.com/Pat8998/crcl-select/"
license=('unknown')
groups=()
depends=('eww' 'jq')
makedepends=('jansson')
source=('https://github.com/Pat8998/crcl-select/releases/download/1.1-3/crcl-sl.tar')
sha256sums=(45fad66c22f594dfa4cd096ec3f931d336dd56eaad82d1613c4982cc4a0fa47e)

build() {
	gcc "eww-circle.c"    		-O3 -o cr-circle-gen   -ljansson -lm
	gcc "eww-execute.c"   		-O3 -o cr-exe          -ljansson -lm
	gcc "eww-angle.c"     		-O3 -o cr-angle        -ljansson -lm
	gcc "eww-circle-select.c" 	-O3 -o c-select    	   -ljansson -lm
}

package() {
	# Create the target directory
	mkdir -p "$pkgdir"/"${HOME#/}"/.config/crcl-select
	mkdir -p "$pkgdir"/"${HOME#/}"/.config/crcl-select/json_files
	
	# Copy compiled binaries
	install -Dm755 "cr-circle-gen" "$pkgdir"/"${HOME#/}"/.config/crcl-select/
	install -Dm755 "cr-exe" "$pkgdir"/"${HOME#/}"/.config/crcl-select/
	install -Dm755 "cr-angle" "$pkgdir"/"${HOME#/}"/.config/crcl-select/
	install -Dm755 "c-select" "$pkgdir"/"${HOME#/}"/.config/crcl-select/
	
	# Copy data files
	install -Dm644 "eww.yuck" "$pkgdir"/"${HOME#/}"/.config/crcl-select/
	install -Dm644 "eww.scss" "$pkgdir"/"${HOME#/}"/.config/crcl-select/
	chmod 	-c		a+rw      "$pkgdir"/"${HOME#/}"/.config/crcl-select/json_files/
	install -Dm644 "json_files/toolbox.json" "$pkgdir"/"${HOME#/}"/.config/crcl-select/json_files/
}
