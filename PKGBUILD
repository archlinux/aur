# Maintainer: Jah Way <jahway603 at protonmail dot com>

_pkgname=zoitechat
pkgname="${_pkgname}"-appimage
pkgver=2.19.1
pkgrel=1
pkgdesc="An easy to use graphical IRC (chat) client, based on HexChat (AppImage version)"
arch=('x86_64')
url="https://github.com/zoitechat/zoitechat"
license=('GPL-2.0-only')
provides=("$_pkgname")
conflicts=(
  "${_pkgname}"
  "${_pkgname}-bin"
  "${_pkgname}-git")
options=('!strip' '!emptydirs')
_appimage="${_pkgname}-${pkgver}.AppImage"
source=("${_appimage}::$url/releases/download/v$pkgver/$_pkgname-$pkgver-$arch.AppImage"
        "LICENSE.$pkgver::https://raw.githubusercontent.com/ZoiteChat/zoitechat/refs/heads/master/COPYING"
        "$_pkgname.png::https://raw.githubusercontent.com/ZoiteChat/$_pkgname/refs/heads/master/data/icons/$_pkgname.png"
        "$_pkgname.desktop")
sha512sums=('30e7dfd809a42b5715e54dc3943dfe04d67f43cc208a1e62594eb7768f46550ab7556b61cb807583bfa9c97ca647c7bb907b3b8ad9f3b94d8fc45068b0b83ae3'
            '80fa01c09e00e0fb2bacc06c8f75366901609dc098ccaca125a3b17a36a2a5a431257a82f8e48653e3588e9cac59466393d39557ec9734f75f5acbee205262c4'
            '96e6ed807edccf79f372beafcdc609672fdd06fcb681c6b0ca6885204ee8db12de97aa2dfd07f072241ae0f13f4d8be2078c01a538e65ae4b3aa4d2a386232c6'
            '83565ad80a86499a880c3f8c77fa315adc0433421f60cb6dd2c52dba10468ef47568245c73099ff8cba136e653e3ee497bb33d6d5af7d8c132f7c5d97f91be47')

prepare() {
  chmod +x "${_appimage}"
}

package() {
  install -Dm755 "${_appimage}" "$pkgdir/opt/$_pkgname/$_pkgname.AppImage"
  install -Dm644 "LICENSE.$pkgver" "$pkgdir/opt/$_pkgname/LICENSE"

  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname.png" "$pkgdir/opt/$_pkgname/$_pkgname.png"

  # symlinks
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "$pkgdir/usr/bin/$_pkgname"
  install -dm755 "$pkgdir/usr/share/licenses/$_pkgname/"
  ln -s "/opt/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname"
}
