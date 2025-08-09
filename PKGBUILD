# Contributor: Johannes Loher <johannes dor loher at fg4f dot de>

pkgname=dfix
pkgver=0.3.5
pkgrel=2
pkgdesc='Tool for automatically upgrading D source code'
arch=('x86_64')
url='https://github.com/dlang-community/dfix'
license=('BSL-1.0')
groups=('dlang')
depends=('gcc-libs')
makedepends=('dmd' 'git')
source=("git+${url}.git#tag=v${pkgver}"
        "git+https://github.com/Hackerpilot/libdparse.git"
        "git+https://github.com/dlang-community/stdx-allocator.git")
sha256sums=('e6a7b66866fb1d0a380116c76ab83faf4526b365a68ed047eb5fd339719e629f'
            'SKIP'
            'SKIP')

prepare() {
	cd dfix
	git submodule init
	git config submodule.libdparse.url "$srcdir/libdparse"
	git config submodule.stdx-allocator.url "$srcdir/stdx-allocator"
	git -c protocol.file.allow=always submodule update
}

build() {
	make -C dfix
}

package(){
	install -Dm755 -t "${pkgdir}/usr/bin" "dfix/bin/dfix"
}
