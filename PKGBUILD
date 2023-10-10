_pkgname=d8vk
pkgname=$_pkgname-bin
pkgver=1.0
pkgrel=1
pkgdesc="Direct3D 8 to Vulkan translation library (Windows DLL binary files)"
url="https://github.com/AlpyneDreams/$_pkgname"
license=('LGPL')
arch=('x86_64')
depends=('vulkan-icd-loader' 'dxvk')
optdepends=('lib32-vulkan-icd-loader: 32-bit Windows application support')
# do not provide vkd3d and lib32-vkd3d intentionally: providing them may break deepin-wine apps.
provides=('d8vk')
conflicts=('d8vk')
options=(!strip)
source=("https://github.com/AlpyneDreams/$_pkgname/releases/download/$_pkgname-v$pkgver/$_pkgname-v$pkgver.tar.gz"
		"setup_d8vk.sh")
sha256sums=('072fef14d13a73b3476997fd64a4167425d6629946464cf843e3f6e3ed9e5f10'
			'a81e9cf0268610415f455cd2417a09fcddfb8d72291a07f297f3ed38416fb2f4')

package() {
	install -D "$srcdir"/x32/* -t "$pkgdir/usr/share/dxvk/x32"
	install setup_d8vk.sh -t "$pkgdir/usr/share/dxvk/"
	install -d "$pkgdir/usr/bin"
	ln -s /usr/share/dxvk/setup_d8vk.sh "$pkgdir/usr/bin/setup_d8vk"
}
