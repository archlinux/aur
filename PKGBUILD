# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

pkgname=xubuntu-artwork
pkgver=25.04
pkgrel=1
pkgdesc="Xubuntu themes and artwork"
arch=("any")
url="https://launchpad.net/xubuntu-artwork"
license=("GPL-2.0" "GPL-3.0" "CC-BY-SA-3.0" )
makedepends=("tar")
optdepends=("plymouth: For the plymouth theme to work"
            "lightdm-gtk-greeter: For LightDM GTK Greeter theme to work"
            "shimmer-wallpapers: Wallpapers not included in the main package, or git version"
            "xfce-theme-bluebird: Official theming, git or stable version"
            "xfce-theme-greybird: Official theming, git or stable version"
            "elementary-xfce-icons: For matching icon theme, or the git version")
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/xubuntu-artwork/${pkgver}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('f2d36cc1e6c288f7ea995e312f5be10292de79f723d87268e3210455fb5a6eb0')

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
}
