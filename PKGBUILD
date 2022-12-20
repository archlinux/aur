# Maintainer: Eugene Lopatkin <eugenelopatkin@gmail.com>
pkgname="linked-helper"
pkgver="2.14.60"
pkgrel=1
pkgdesc="LinkedIn lead generation tool businesses use to find clients"
arch=("any")
url="https://www.linkedhelper.com/"
license=("unknown")
depends=("gtk3" "libnotify" "nss" "libxtst" "xdg-utils" "at-spi2-core" "libdrm" "mesa" "libxcb")
optdepends=("kde-cli-tools" "kdepim-runtime" "trash-cli" "glib2" "gvfs" "pulseaudio" "alsa-lib" "gnome-keyring" "lsb-release")
source=("https://do0ca1hx6twig.cloudfront.net/linked-helper/444657160c922f6b8048468fef840020/latest/linux/x64/linked-helper.deb")
noextract=("linked-helper.deb")
sha512sums=('SKIP')

pkgver() {
	bsdtar -O -xf linked-helper.deb control.tar.xz | bsdtar -xJf -
	version=$(grep -Po '^Version: \K.*' control)
	rm control
	echo $version
}

package() {
    bsdtar -O -xf linked-helper.deb data.tar.xz | bsdtar -C "$pkgdir" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/usr/share/doc"
    rm "${startdir}/linked-helper.deb"
}
