# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname=cewl
pkgver=5.1
pkgrel=1
pkgdesc="A custom word list generator"
arch=(any)
url="https://digi.ninja/projects/cewl.php"
license=('GPL3')
depends=(ruby ruby2.1-bundler perl-image-exiftool)
source=("https://digi.ninja/files/cewl_5.1.tar.bz2")
md5sums=(ff40c1a4eb67c4169c5ec80e1489bee4)

build() {
	  cd "$srcdir"/"$pkgname"
          bundle-2.1 install
          sed -i "91 c\require '/usr/share/cewl/cewl_lib'" cewl.rb 
}

package() {
	cd "$srcdir"/"$pkgname"
	install -dm755 "$pkgdir"/usr/bin
        install -dm755 "$pkgdir"/usr/share/"$pkgname"
        cp -rf * "$pkgdir"/usr/share/"$pkgname"/
        chmod +x "$pkgdir"/usr/share/"$pkgname"/cewl.rb
        ln -s /usr/share/"$pkgname"/cewl.rb "$pkgdir"/usr/bin/"$pkgname"
}
