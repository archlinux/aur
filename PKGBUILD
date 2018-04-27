# Maintainer: Luís Ferreira <contact@lsferreira.net>

pkgname=vulkan-headers-git
pkgver=r232.c51545d3
pkgrel=1
pkgdesc="Vulkan header files"
groups=('vulkan-devel')
arch=('any')
url="https://github.com/KhronosGroup/Vulkan-Docs"
provides=('vulkan-headers')
license=('custom')
conflicts=('vulkan-headers')
source=("git+https://github.com/KhronosGroup/Vulkan-Docs.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Vulkan-Docs"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755 "$pkgdir/usr/include/vulkan/"
  install -dm755 "$pkgdir/usr/share/vulkan"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

  install -m644 ${srcdir}/Vulkan-Docs/include/vulkan/*.h "$pkgdir/usr/include/vulkan"
  install -m644 "$srcdir/Vulkan-Docs/xml/vk.xml" "$pkgdir/usr/share/vulkan"
  install -m644 "$srcdir/Vulkan-Docs/copyright-ccby.txt" "$pkgdir/usr/share/licenses/$pkgname/copyright-ccby.txt"
  install -m644 "$srcdir/Vulkan-Docs/copyright-spec.txt" "$pkgdir/usr/share/licenses/$pkgname/copyright-spec.txt"
}
