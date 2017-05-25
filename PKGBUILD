# Maintainer: Michail Pevnev <mpevnev@gmail.com>

pkgname=dyaml-git
pkgver=v0.4.5.r402.5a52601
pkgrel=1
pkgdesc="YAML parser and emitter for D language - git checkout"
arch=('x86_64' 'i686')
url='https://github.com/dlang-community/D-YAML'
license=('custom:Boost')
makedepends=('git' 'dub')
depends=('bash')
source=('git://github.com/dlang-community/D-YAML.git'
	'git://github.com/ximion/tinyendian.git' # a dependency
	'dyaml-config'
	)
md5sums=('SKIP' 'SKIP' 'f8eb0fbdedb405f8f547790835c41234')

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

	mkdir -p $pkgdir/usr/lib
	mkdir -p $pkgdir/usr/include/dyaml/dyaml
	mkdir -p $pkgdir/usr/bin
	install -Dm 644 LICENSE_1_0.txt $pkgdir/usr/share/licenses/dyaml-git/LICENSE
	install -Dm 644 libdyaml.a $pkgdir/usr/lib/
	install -Dm 644 source/yaml.d $pkgdir/usr/include/dyaml
	install -Dm 644 source/dyaml/* $pkgdir/usr/include/dyaml/dyaml
	install -Dm 644 ../tinyendian/source/tinyendian.d $pkgdir/usr/include/dyaml
	install -Dm 755 ../dyaml-config $pkgdir/usr/bin/
}

