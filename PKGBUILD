# Maintainer: Michail Pevnev <mpevnev@gmail.com>

pkgname=dyaml-git
pkgver=0.6.1
pkgrel=1
pkgdesc="YAML parser and emitter for D language - git checkout"
arch=('x86_64' 'i686')
url='https://github.com/dlang-community/D-YAML'
license=('custom:Boost')
makedepends=('git' 'dub')
depends=()
source=('git://github.com/dlang-community/D-YAML.git'
	'git://github.com/dlang-community/tinyendian.git' # a dependency
	'dyaml.pc'
	)
md5sums=('SKIP' 
	'SKIP' 
	'644cd62a321debe2c27a90af3cc70b29'
	)

pkgver() {
	cd "$srcdir/D-YAML"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/D-YAML"
	dub build -b release
}

package() {
	cd "$srcdir/D-YAML"

	mkdir -p $pkgdir/usr/include/dyaml/dyaml
	mkdir -p $pkgdir/usr/share/doc/dyaml
	install -Dm 644 libdyaml.a $pkgdir/usr/lib/libdyaml.a
	install -Dm 644 source/yaml.d $pkgdir/usr/include/dyaml/yaml.d
	install -Dm 644 source/dyaml/* $pkgdir/usr/include/dyaml/dyaml/
	install -Dm 644 ../tinyendian/source/tinyendian.d $pkgdir/usr/include/dyaml/tinyendian.d
	install -Dm 644 ../dyaml.pc $pkgdir/usr/share/pkgconfig/dyaml.pc
	install -Dm 644 LICENSE_1_0.txt $pkgdir/usr/share/licenses/dyaml-git/LICENSE
	cp -r doc/html $pkgdir/usr/share/doc/dyaml
}
