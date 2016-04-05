# Maintainer: João Raimundo <joao.raimundo@gmail.com>
# Contributor: Daniel Renninghoff <renninghoff at archlinux dot info>
# Contributor: Carl George <carl at carlgeorge dot us>
pkgname=mint-themes
pkgver=3.18+2
pkgrel=1
pkgdesc="Mint-X GTK2, GTK3, Metacity and Xfce theme."
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-themes"
license=('GPL3')
optdepends=('gtk-engine-murrine: for the GTK2 theme'
            'mint-x-icons: Mint icon theme')
conflicts=('mint-x-theme')
source=("${url}/${pkgname}_1.4.6.tar.gz"
        "${url}-gtk3/${pkgname}-gtk3_3.18+2.tar.xz")
sha256sums=('49efc330923d4aef8d55ac589bca57882a9c52f69d8efa4c588863575b09e0d2'
            '371a9c37b6261f65cd9180948f5197698c802efc7bddfa6f182da0f33c4a3435')

prepare() {
	# fix permissions
	find ${srcdir} -type f ! -perm 644 -print0 | xargs -0 chmod --quiet 644
}

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/usr/share"
  install -d "$pkgdir/usr/lib/libreoffice/share/config"
  cp -a usr/share/themes "$pkgdir/usr/share"
  if [ -f usr/share/libreoffice/share/config/images_human.zip ]; then
    cp -a usr/share/libreoffice/share/config/images_human.zip "$pkgdir/usr/lib/libreoffice/share/config"
  fi
  cd "$srcdir/${pkgname}-gtk3"
  cp -R usr/share/themes "$pkgdir/usr/share"
}
