# Maintainer: Daniel Maier <ifany.net at protonmail dot com>

pkgname=blender-plugin-facebuilder
pkgver=2022.1.1
#this may stop working so please insert your current /usr/share/blender/$blender_version
_blender_version=$(pacman -Qi blender | grep Version | cut -b 22-24)
pkgrel=1
pkgdesc='Generate blender textures from facial images'
arch=('any')
url='https://keentools.io/products/face-builder-for-blender'
#only limited-time trial version, for EULA see https://links.keentools.io/eula
license=('GPLv3' 'custom')
depends=('blender')
makedepends=('git')
install=facebuilder.install
source=('git+https://github.com/keentools/keentools-blender.git'
        'https://d28thnhqld34mt.cloudfront.net/pykeentools_releases/2022.1.1/keentools-core-2022.1.1-linux.zip')
sha512sums=('SKIP'
            '50b069bc3dd1b187143aa73634a2d4dce1935c12cff4cf578161a37671a1a87f83b8d279f146841625d6cc89e618688b34e92d9cbe0781f73e8f6eb752bc6682')

package() {
  install -d "$pkgdir/usr/share/blender/$_blender_version/scripts/addons"
  mv "$srcdir/keentools-blender/keentools" "$pkgdir/usr/share/blender/$_blender_version/scripts/addons/keentools_facebuilder"

  install -d "$pkgdir/usr/share/blender/$_blender_version/scripts/addons/keentools_facebuilder/blender_independent_packages/pykeentools_loader/pykeentools"
  mv "$srcdir/pykeentools_installation" "$pkgdir/usr/share/blender/$_blender_version/scripts/addons/keentools_facebuilder/blender_independent_packages/pykeentools_loader/pykeentools"

  install -D -t "$pkgdir/usr/share/licenses/keentools-facebuilder" "$srcdir/../LICENSE"
}

