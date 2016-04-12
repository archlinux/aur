# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=xubuntu-artwork
pkgver=16.04.1
pkgrel=1
_uver=wily
pkgdesc="Xubuntu themes and artwork"
arch=("any")
url="https://launchpad.net/xubuntu-artwork"
license=("GPL")
#depends=("xfce-theme-albatross" "xfce-theme-bluebird" "xfce-theme-greybird" "shimmer-wallpapers")
makedepends=("zip")
optdepends=("plymouth: For plymouth theme to work"
        "lightdm-gtk-greeter: For LightDM GTK-3 Greeter theme to work"
        "shimmer-wallpapers: Wallpapers not included in the main package"
        "xfce-theme-albatross: Official theming, git or stable versions are ok"
        "xfce-theme-bluebird: Official theming, git or stable version are ok"
        "xfce-theme-greybird: Official theming, git or stable version are ok"
	"elementary-xfce-icons: For matching icon theme, or if you want use the git version"
	"libreoffice: For the new elementary icon style")
source=("http://security.ubuntu.com/ubuntu/pool/universe/x/${pkgname}/${pkgname}_${pkgver}.tar.xz")

package() {
  cd "${srcdir}/trunk"

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
# I use MD5 because is what "makepkg -g" give by default, blame Allan

md5sums=('ad7058efdaef7a3fabf4651b09aa74f7')
