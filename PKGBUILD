# Maintainer: João Raimundo <joao.raimundo@gmail.com>
# Contributor: Daniel Renninghoff <renninghoff at archlinux dot info>
# Contributor: Carl George <carl at carlgeorge dot us>
pkgname=mint-themes
pkgver=3.14_8
pkgrel=1
pkgdesc="Mint-X GTK2, GTK3, Metacity and Xfce theme."
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-themes"
license=('GPL3')
optdepends=('gtk-engine-murrine: for the GTK2 theme'
            'mint-x-icons: Mint icon theme')
conflicts=('mint-x-theme')
source=("${url}/${pkgname}_1.4.5.tar.gz"
        "${url}-gtk3/${pkgname}-gtk3_3.14+9.tar.gz")
sha256sums=('0962910cfda8f93eff90ec33a162e482e2a55b90cd389c11479e94cb4059f93c'
            '71ae8c96ba5c067763f448d919d494dc6f66e451a42b98806ed20b15f97ed455')

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
