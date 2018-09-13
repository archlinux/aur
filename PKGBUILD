# Maintainer: Anna <morganamilo@gmail.com>

pkgnamebase=vk9-bin
pkgname=(vk9-bin lib32-vk9-bin vk9-data-bin)
pkgver=0.27.0
pkgrel=1
pkgdesc='Direct3D 9 compatibility layer using Vulkan'
arch=('x86_64' 'i686')
url='https://github.com/doitsujin/vk9'
license=('custom:zlib/libpng')
options=(!strip)
source=(setup_vk9-{x86_64,i686}.verb setup_vk9{,-32})
source_x86_64=("$pkgname-$pkgver-$CARCH.zip::https://github.com/disks86/VK9/releases/download/$pkgver/$pkgver-bin-x86_64-Release.zip")
source_i686=("$pkgname-$pkgver-$CARCH.zip::https://github.com/disks86/VK9/releases/download/$pkgver/$pkgver-bin-x86-Release.zip")
md5sums=('6600eabb853962260068f86d9a70aed1'
         'aaf4cb6c959a9dfcab2ec8ec8f802909'
         '42de90e0a79a9eef2410799044521f39'
         'c4d6aafd335443ddc5d0cc5495511db3')
md5sums_x86_64=('22afc73d4e7d1b3c7d67b1e470a6c5c3')
md5sums_i686=('22afc73d4e7d1b3c7d67b1e470a6c5c3')

package_vk9-bin() {
	arch=('x86_64' 'i686')
	depends=('vk9-data' 'vulkan-icd-loader' 'wine' 'winetricks')
	provides=('vk9')
	conflicts=('vk9')

	install -Dm644 "d3d9.dll" "$pkgdir/usr/lib/d3d9.dll"
	install -Dm755 "setup_vk9" "$pkgdir/usr/bin/setup_vk9"
	install -Dm644 "setup_vk9-$CARCH.verb" "$pkgdir/usr/share/vk9/setup_vk9.verb"
}


package_lib32-vk9-bin() {
	arch=('x86_64')
	depends=('vk9-data')
	provides=('lib32-vk9')
	conflicts=('lib32-vk9')

	install -Dm644 "d3d9.dll" "$pkgdir/usr/lib32/d3d9.dll"
	install -Dm755 "setup_vk9-32" "$pkgdir/usr/bin/setup_vk9-32"
	install -Dm644 "setup_vk9-i686.verb" "$pkgdir/usr/share/lib32-vk9/setup_vk9.verb"
}

package_vk9-data-bin() {
	arch=('any')
	provides=('vk9-data')
	conflicts=('vk9-data')
	backup=('etc/VK9.conf')

	install -Dm644 "VK9.conf" "$pkgdir/etc/VK9.conf"

	for f in VertexBuffer*; do
		install -Dm644 "$f" "$pkgdir/usr/share/vk9/$f"
	done
}
