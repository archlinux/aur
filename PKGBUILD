# Maintainer: Andy Alt <andy400-dev@yahoo.com>
# Maintainer: Ilan Frumer <ilanfrumer@gmail.com>

_modname=boongui
pkgname=0ad-${_modname}
pkgver=2.4.1
pkgrel=1
pkgdesc="User interface mod for the RTS game 0 A.D."
arch=('any')
url="https://github.com/LangLangBart/boonGUI"
license=('MIT', 'CCPL')
makedepends=('unzip')
#depends=('0ad')
source=("${url}/releases/latest/download/${_modname}.pyromod")
noextract=("${source[@]##*/}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}"
    unzip -oq "${_modname}.pyromod" "mod.json"
    cat "mod.json" | grep -oP '(?<="version": ")[^"]*' 
}

package() {
  cd "${srcdir}"
  unzip -o "${_modname}.pyromod" "ARTWORK_and_LICENSE.txt"
  install -Dm644 "ARTWORK_and_LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"  
  install -Dm644 "${_modname}.pyromod" -t "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  cd "${pkgdir}/usr/share/0ad/data/mods/${_modname}"
  unzip -o "${_modname}.pyromod" "mod.json"
}
