# Maintainer: Robin Becker
# 	based on work by
#		Maintainer: Jan Pacner
#		Contributor: dumblob <dumblob@gmail.com>

pkgname=packer-combined
pkgver=20150724_1408
pkgrel=1
pkgdesc='Extended bash wrapper for pacman and aur see packer --help for extra features'
url="https://bitbucket.org/replabrobin/packer"
license=('GPL3')
arch=('any')
source=("$pkgname::hg+https://bitbucket.org/replabrobin/packer")
sha256sums=('SKIP')
# most of depends are not needed, they're present only for clarity
depends=('grep' 'sed' 'bash' 'curl' 'pacman' 'jshon')
makedepends=('mercurial')
optdepends=('sudo: install and update packages as non-root'
            'customizepkg: apply customizepkg modifications')
provides=('packer')
conflicts=('packer')

build() {
	true
	}

pkgver() {
	cd "$pkgname"
	hg log --limit=1 --template='{date|isodate}' | sed -e's/ /_/;s/ .*$//;s/-//g;s/://'
	}

package(){
	cd "$pkgname"
	install -D -m 755 packer "$pkgdir/usr/bin/packer"
	install -D -m 644 packer.8 "$pkgdir/usr/share/man/man8/packer.8"
	}
