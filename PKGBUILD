# Maintainer: Jah Way <jahway603 at protonmail dot com>

_pkgname=zoitechat
pkgname="${_pkgname}"-appimage
pkgver=2.19.0
pkgrel=2
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
        "LICENSE::https://raw.githubusercontent.com/ZoiteChat/zoitechat/refs/heads/master/COPYING"
#		https://raw.githubusercontent.com/ZoiteChat/zoitechat/refs/heads/master/COPYING
        "$_pkgname.png::https://raw.githubusercontent.com/ZoiteChat/$_pkgname/refs/heads/master/data/icons/$_pkgname.png"
        "$_pkgname.desktop")
sha512sums=('4f178d1d805b758c9de4d1e4f002eba1dde5e7a6d481b223d49fb51c3c68b34c4af6898462175a760dfb6c47b4ccdd215a3be8ce64429c73e8c9021a5af5dd1a'
            '7a1dba2c878f7a2395175da465a20103ac7e33b145c662373114cd84a29b2b1f0a45e04e6140cdcdf56c11e2e0260dab90a2cc29babc0e6cbf1676b1dd377af2'
            '96e6ed807edccf79f372beafcdc609672fdd06fcb681c6b0ca6885204ee8db12de97aa2dfd07f072241ae0f13f4d8be2078c01a538e65ae4b3aa4d2a386232c6'
            '83565ad80a86499a880c3f8c77fa315adc0433421f60cb6dd2c52dba10468ef47568245c73099ff8cba136e653e3ee497bb33d6d5af7d8c132f7c5d97f91be47')

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
