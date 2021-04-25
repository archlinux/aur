# Maintainer: Emeric Grange <emeric.grange@gmail.com>
# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

_pkgname=shadered
pkgname=$_pkgname-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="Lightweight tool for creating and testing HLSL and GLSL shaders."
arch=("x86_64")
url="https://github.com/dfranx/SHADERed"
license=("MIT")
depends=(gtk3 sdl2 sfml assimp glew-2.1 glm spirv-headers)
provides=('shadered')
conflicts=('shadered' 'shadered-git')

source=("$_pkgname-$pkgver.zip::$url/releases/download/v$pkgver/Linux.zip"
        "org.shadered.SHADERed.desktop"
        "SHADERed.sh")
sha256sums=('5abac1183bdd5d2dfe6cb2f9b184301722fae06321ec1a7518815e1c6231c800'
            'c3ecaa1f791aef4ba0a46236e9a133310a5bf981c8f1d98108c5a34b0b9edee6'
            '885a7c14a7e00477c9acce4c64145e075a044be7a9f774b272cd5af7bde31ee9')

package() {
  mkdir -p "$pkgdir/usr/share/$_pkgname"
  cp -r SHADERed/* "$pkgdir/usr/share/$_pkgname"
  install -Dm755 SHADERed.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 org.shadered.SHADERed.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  for res in 32 64 128 256
  do
    install -Dm644 SHADERed/icon_${res}x${res}.png \
      "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/$_pkgname.png"
  done
}
