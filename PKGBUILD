# Maintainer: Mario Oenning <mo-son[at]mailbox[dot]org>
# Author: thgier <https://github.com/thgier>

_pkgname=potatopresenter
pkgname="${_pkgname}"-appimage
pkgver=1.0.0
pkgrel=2
pkgdesc="Tool to create presentation slides that can be exported as PDF."
arch=('x86_64')
url="https://github.com/thgier/PotatoPresenter"
license=('LGPL2.1')
optdepends=('texlive-latexextra: for LaTeX formular support'
            'texlive-fontsextra: for LaTeX formular support'
            'texlive-science: for LaTeX formular support')
provides=('potatopresenter')
conflicts=('potatopresenter')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source=("$_appimage::$url/releases/download/v${pkgver}/Potato_Presenter-v${pkgver}-x86_64.AppImage"
        "potatopresenter.desktop"
        "https://raw.githubusercontent.com/thgier/PotatoPresenter/master/potato_logo.svg")
noextract=("$_appimage")
sha256sums=('64cb3486a1a3f4cd6488410b74ad1dc282ff530e5ef58186d1d6e07aa709ddd2'
            '030597070eefe827d1895f3736cf2c70753e2ca13812350610122193976a2a7c'
            'd96b384a4e8ba5365785f9be8cd77e2f54d0ae767de7ae4c2f2f52c9de0e083b')

package() {
  # AppImage
  install -Dm755 "$_appimage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
  
  # application file
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

  # icon
  install -Dm644 "potato_logo.svg" "$pkgdir/usr/share/${_pkgname}/logo.svg"
}


