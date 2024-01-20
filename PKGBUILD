# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

pkgname=xubuntu-artwork
pkgver=24.04
pkgrel=1
_uver=focal
pkgdesc="Xubuntu themes and artwork"
arch=("any")
url="https://launchpad.net/xubuntu-artwork"
license=("gpl2" "gpl3" "custom:cc-by-sa-3.0")
makedepends=("zip")
optdepends=("plymouth: For the plymouth theme to work"
            "lightdm-gtk-greeter: For LightDM GTK Greeter theme to work"
            "shimmer-wallpapers: Wallpapers not included in the main package, or git version"
            "xfce-theme-bluebird: Official theming, git or stable version"
            "xfce-theme-greybird: Official theming, git or stable version"
            "elementary-xfce-icons: For matching icon theme, or the git version")
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.tar.xz"
        "CC-BY-SA-3.0.txt")
sha256sums=('5492793da8218f9f6c7a41231da8d325d5ce662a2a8c7d50de6c5d3c8ed6b72d'
            '129f20089a0c2fe1ac3607fc1761ef177effbf354aeed1fd9def9bcaf4d024ee')

package() {
  cd "${srcdir}/${pkgname}"

  install -dm755 "${pkgdir}/usr/"

  msg2 "Install the rest of the files."
  cp -av usr/share/ "${pkgdir}/usr/share/"

  msg2 "Remove Elementary-Xfce bundled with this artwork, is hella outdated."
  rm -frv "${pkgdir}"/usr/share/icons

  msg2 "Move backdrops to a better place for Xfce 4.12+."
  mkdir -p "${pkgdir}/usr/share/backgrounds/xfce"
  mv -v "${pkgdir}"/usr/share/xfce4/backdrops/* "${pkgdir}"/usr/share/backgrounds/xfce

  msg2 "Remove redundant and empty files."
  rm -frv "${pkgdir}"/usr/share/xfce4/backdrops

  install -D -m644 "${srcdir}/CC-BY-SA-3.0.txt" "${pkgdir}/usr/share/licenses/${pkgbase}/CC-BY-SA-3.0.txt"
}