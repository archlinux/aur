# Maintainer: Ruiqi "Richard" Niu <rniu5@jh.edu>
# Contributor: GLM-5.2 <https://docs.z.ai/guides/llm/glm-5.2>
# Contributor: Adrian Wheeldon <arandomowl at gmail dot com>
pkgname=workcraft
pkgver=3.5.5
pkgrel=1
pkgdesc='Toolset to capture, simulate, synthesize and verify graph models'
# Upstream bundles native helper tools in tools/, among which mpsat, pcomp, petrify, espresso, scenco and vxm are 32-bit.
# They are all statically linked and will run with IA-32 emulation in the kernel, so no lib32-* packages are needed.
arch=('x86_64')
url='https://workcraft.org/'
license=('MIT')
depends=('java-runtime>=17' 'hicolor-icon-theme')
optdepends=(
  'graphviz: render Graphviz DOT files exported by Workcraft (a bundled dot is also shipped for in-app layout)'
  'stack: Plato concepts-to-STG/FSM translation (bundled in tools/plato)')
options=('!debug')
source=("$pkgname-v$pkgver-linux.tar.gz::https://workcraft.org/_media/download/workcraft-v${pkgver}-linux.tar.gz")
sha256sums=('ce9bb037056ef621fb2521ec4b21adde097ab303876b66fdb830bc0a4d8cb67a')

package() {
  mkdir -p "$pkgdir"/opt "$pkgdir"/usr/bin
  install -Dm644 "$srcdir/$pkgname/$pkgname".svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/"$pkgname".svg
  install -Dm644 "$srcdir/$pkgname/$pkgname".svg "$pkgdir"/usr/share/icons/hicolor/scalable/mimetypes/application-x-"$pkgname".svg
  install -Dm644 "$srcdir/$pkgname/$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
  install -Dm644 "$srcdir/$pkgname/$pkgname".xml "$pkgdir"/usr/share/mime/packages/"$pkgname".xml
  install -Dm644 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE.txt
  mv "$srcdir/$pkgname" "$pkgdir"/opt/"$pkgname"
  ln -s /opt/workcraft/workcraft "$pkgdir"/usr/bin/workcraft
}
