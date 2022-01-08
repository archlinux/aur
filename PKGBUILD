# Maintainer: Daniel Maier <ifany.net at protonmail dot com>

pkgname=blender-plugin-facebuilder
pkgver=4.0
_blender_version=3.0
_commit=ea72b68da678208811238c1a0fc03125517e04b6
pkgrel=0
pkgdesc='wrap human faces from images (keentools.io)'
arch=('any')
url='https://keentools.io/products/face-builder-for-blender'
#only limited-time trial version; for EULA see https://links.keentools.io/eula
license=('GPLv3' 'custom')
#for now need prebuilt files from blender.org, for upstream
#does not support python-3.10 yet (includes incompatible binary models)
#also this wasn't no tested on 2.xx versions
depend=('blender-3.0-bin')
makedepends=('git')
install=facebuilder.install
source=('git+https://github.com/keentools/keentools-blender.git'
        'https://d28thnhqld34mt.cloudfront.net/pykeentools_releases/2021.4.0/keentools-core-2021.4.0-linux.zip')
sha512sums=('SKIP'
            '346b5dd3bd52e47c47731d395b0000e9c37cdcd75a2e844d28657b87976bf68249b161b3716d8ac687383986de71cbcb50f551b8b54eeaddb07491b1177c9949')

package() {
  install -d "$pkgdir/usr/share/blender/$_blender_version/scripts/addons"
  mv "$srcdir/keentools-blender/keentools_facebuilder" "$pkgdir/usr/share/blender/$_blender_version/scripts/addons"

  install -d "$pkgdir/usr/share/blender/$_blender_version/scripts/addons/keentools_facebuilder/blender_independent_packages/pykeentools_loader/pykeentools"
  mv "$srcdir/pykeentools_installation" "$pkgdir/usr/share/blender/$_blender_version/scripts/addons/keentools_facebuilder/blender_independent_packages/pykeentools_loader/pykeentools"

  install -D -t "$pkgdir/usr/share/licenses/keentools-facebuilder" "$srcdir/../LICENSE"
}
