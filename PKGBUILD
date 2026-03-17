# Maintainer: Vee Satayamas <veerpub@pm.me>

pkgname=('ttf-arundina')
pkgver=0.4.0
pkgrel=1
pkgdesc='Thai fonts aiming at Bitstream Vera and Dejavu compatibility'
arch=('any')
license=('GPL' 'custom')
makedepends=('fontforge')
url=https://linux.thai.net/projects/fonts-sipa-arundina
source=("https://linux.thai.net/pub/thailinux/software/fonts-arundina/fonts-arundina-$pkgver.tar.xz")
md5sums=('de86bd769489e11b71324dd47272602a')

build() {
    cd fonts-arundina-$pkgver
    ./configure \
	--disable-latex \
	--disable-pfb \
	--disable-otf \
	--prefix=/usr \
	--sysconfdir=/etc \
	--with-ttfdir=/usr/share/fonts/arundina
    make
}

package() {
    cd fonts-arundina-$pkgver
    make DESTDIR="${pkgdir}" install
    mkdir -p "${pkgdir}"/etc/fonts
    mv "${pkgdir}"/usr/share/fontconfig/conf.avail "${pkgdir}"/etc/fonts
    rm -r "${pkgdir}"/usr/share/fontconfig

    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
