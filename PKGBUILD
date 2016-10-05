#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname='fbx-sdk-extensions'
pkgver=2017.0.1
pkgrel=1
pkgdesc='Platform and API toolkit to transfer existing content into the FBX format, extensions.'
arch=('any')
url='http://www.autodesk.com/products/fbx/overview'
license=('custom')
depends=('fbx-sdk')
install='fbx-sdk-extensions.install'
_verstr=`echo ${pkgver:0:4}${pkgver:5} | sed 's/\./_/g'`
source=("http://download.autodesk.com/us/fbx/${pkgver:0:4}/${pkgver}/fbx${_verstr}_fbxextensionssdk_linux.tar.gz")
md5sums=('86e9213f8a3e21cd19bb132426c7c2cb')

build() {
  cd "$srcdir"

  rm -rf "fbx-sdk"
  mkdir "fbx-sdk"
  chmod +x "./fbx${_verstr}_fbx_extension_sdk_linux"
  printf "yes\nn\n" | "./fbx${_verstr}_fbx_extension_sdk_linux" "$srcdir/fbx-sdk"
}

package() {
  cd "$srcdir/fbx-sdk"

  install -D "readme.txt" "$pkgdir/usr/share/doc/fbx-sdk/extensions_readme.txt"
  cp -r plugins "$pkgdir/usr/share/doc/fbx-sdk/extensions_plugins"
  install -D "License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

