# Maintainer: Jah Way <jahway603 at protonmail dot com>

_pkgname=aster-mail
pkgname="${_pkgname}"-appimage
pkgver=1.4.59
pkgrel=1
pkgdesc="Encrypted email client for Aster Mail (AppImage version)"
arch=('x86_64')
url="https://github.com/Aster-Privacy/Aster-Mail"
license=('AGPL-3.0-only')
provides=("$_pkgname")
conflicts=(
  "${_pkgname}"
  "${_pkgname}-bin"
  "${_pkgname}-git"
)
options=('!strip' '!emptydirs')
_appimage="${_pkgname}-${pkgver}.AppImage"
#source=("${_appimage}::$url/releases/download/v$pkgver/Aster.Mail_{$pkgver}_amd64.AppImage"
source=("${_appimage}::$url/releases/download/v$pkgver/Aster-Mail-x64.AppImage"
        "https://raw.githubusercontent.com/Aster-Privacy/Aster-Mail/refs/heads/main/LICENSE"
        "$_pkgname.png::https://raw.githubusercontent.com/Aster-Privacy/Aster-Mail/refs/heads/main/android/app/src/main/res/drawable-land-mdpi/splash.png"
        "$_pkgname.desktop")
sha512sums=('6e87270ce2554574596af74e9a26e2b2c39fd833dd21bab087dd01ae9e960ae76a0ad5b6fb896a0af623426ae156b5c0d4b98223640049de8fb046bd3240d81b'
            '3568a76677f3d55dbbc7fc33c4073b4714cc6f68d92cd842a9ca2b230e8bd2140e59c3fc3cce34be34ffed78d75ab6e9d991ba59bf7c4addde7fb96648d3375d'
            '2c1905126bb5a533ee295a4b4fa0ba4a7e5d3f6ca105eb606e5945991b3f3fcbfe5a497a92f9ff804afd7ad63e5404c4a35c25c1f2cece608210b4ccde8af344'
            'fe8b7372a2bba16e20151001be13a2b815e5d1ed7047f8fc12ea8d56ce235c6515cdf6163bd01f80cc207a8e24a29025f94d1a673d4464ce3d1b8a61aa605fea')

prepare() {
  chmod +x "${_appimage}"
}

package() {
  install -Dm755 "${_appimage}" "$pkgdir/opt/$_pkgname/$_pkgname.AppImage"
  install -Dm644 "LICENSE" "$pkgdir/opt/$_pkgname/LICENSE"

  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname.png" "$pkgdir/opt/$_pkgname/$_pkgname.png"

  # symlinks
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "$pkgdir/usr/bin/$_pkgname"
  install -dm755 "$pkgdir/usr/share/licenses/$_pkgname/"
  ln -s "/opt/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname"
}
