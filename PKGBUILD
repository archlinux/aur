# Maintainer: Daniel Renninghoff <renninghoff at archlinux dot info>
# Contributor: Carl George <carl at carlgeorge dot us>
pkgname=mint-themes
pkgver=3.14_7
pkgrel=1
pkgdesc="Mint-X GTK2, GTK3, Metacity and Xfce theme."
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-themes"
license=('GPL3')
optdepends=('gtk-engine-murrine: for the GTK2 theme'
            'mint-x-icons: Mint icon theme')
conflicts=('mint-x-theme')
source=("${url}/${pkgname}_1.4.0.tar.gz"
        "${url}-gtk3/${pkgname}-gtk3_3.14+7.tar.gz")
sha256sums=('404757ea4990d14868e736068df7f98cd3607239b3d9aea12376cef9fbd02bf8'
            '7ede53d9774cc5741dd50ab72276aba0cca87dca4bc47a079a05a314f3c37d64')

prepare() {
	# fix permissions
	find ${srcdir} -type f ! -perm 644 -print0 | xargs -0 chmod --quiet 644
}

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/usr/share"
  install -d "$pkgdir/usr/lib/libreoffice/share/config"
  cp -a usr/share/themes "$pkgdir/usr/share"
  cp -a usr/share/libreoffice/share/config/images_human.zip "$pkgdir/usr/lib/libreoffice/share/config"
  cd "$srcdir/${pkgname}-gtk3"
  cp -R usr/share/themes "$pkgdir/usr/share"
}
