# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=taskcore
pkgver=1.0.0beta2
_pkgver=1.0.0-beta.2
pkgrel=1
pkgdesc='Command Line ToDo Management Application'
arch=('x86_64')
url='https://github.com/tarikguney/taskcore'
license=("APACHE")
makedepends=("dotnet-sdk")
options=("staticlibs")
source=("${url}/archive/v${_pkgver}.tar.gz")
sha256sums=('1548acad299dd8426f377d77d6e24111aa63286200fc93397aedbf399024530f')

build() {
  cd "${pkgname}-${_pkgver}/TaskCore.App"
  MSBUILDDISABLENODEREUSE=1 dotnet publish \
    --configuration Release \
    --self-contained true \
    --runtime linux-x64 \
    -p:PublishTrimmed=true \
    --output ../${pkgname} \
    ./TaskCore.App.csproj
}

package() {
  cd "${pkgname}-${_pkgver}"

  install -d $pkgdir/usr/{bin,lib}
  cp -r ${pkgname} "$pkgdir/usr/lib/"
  ln -s "/usr/lib/${pkgname}/${pkgname}" "$pkgdir/usr/bin/${pkgname}"

  install -Dm644 README.md --target-directory="$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE --target-directory="$pkgdir/usr/share/licenses/$pkgname/"
}
