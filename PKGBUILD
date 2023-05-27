# Maintainer: éclairevoyant
# Contributor: Sara <sara at archlinux dot us>
# Contributor: aksr <aksr at t-com dot me>

_pkgname=cnoor
pkgname="$_pkgname-git"
pkgver=r94.2b58c5a
pkgrel=1
pkgdesc="Simple framebuffer holy Quran viewer"
arch=(i686 x86_64)
url="https://litcave.rudi.ir/"
license=(unknown)
depends=(pango)
makedepends=(git mold)
optdepends=('ttf-sil-scheherazade: quran font'
            'ttf-dejavu: reader font')
source=("git://repo.or.cz/$_pkgname.git"
        $_pkgname.1)
b2sums=('SKIP'
        'fc621c7109234fca67915804a7f6e9b408f4d8e643cb021fd3b05a72f37bb8de9fa2df34f866b09f8a2d1a56c9e7fc8eada65753a30c217db0150468208c4b00')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	sed -i '/FLAGS =/ s/=/+=/' $_pkgname/Makefile
}

build() {
	# does not link correctly with as-needed and ld
	mold -run make -C $_pkgname all
}

package() {
	cd $_pkgname
	install -Dm755 $_pkgname -t "$pkgdir/usr/bin/"
	install -Dm755 README -t "$pkgdir/usr/share/doc/$_pkgname/"
}
