# Maintainer: Savino Jossi <savino.jossi@gmail.com>

_pkgname=scientifica
pkgname=${_pkgname}-font
pkgver=1.0.1
pkgrel=1
pkgdesc='Tall and condensed bitmap font for geeks.'
arch=(any)
url=http://sourceforge.net/projects/terminus-font/
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
conflicts=(scientifica-font)
provides=(scientifica-font)
install=scientifica-font.install
source=(https://raw.githubusercontent.com/sjossi/scientifica-font/master/75-yes-scientifica.conf
        https://raw.githubusercontent.com/NerdyPepper/scientifica/master/scientifica-11.bdf)
md5sums=('527aa5ed9023e7d2face57d48cfce034'
         'de50582940a1203984f18f8fdfabeccc')

build()
{
cat <<EOF > 75-yes-scientifica.conf
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
<!-- Accept scientifica font -->
  <selectfont>
    <acceptfont>
      <pattern>
        <patelt name="family"><string>scientifica</string></patelt>
      </pattern>
    </acceptfont>
  </selectfont>
</fontconfig>
EOF
}

package()
{
  install -Dm644 scientifica-11.bdf "${pkgdir}/usr/share/fonts/misc/scientifica-11.bdf"
  install -Dm644 75-yes-scientifica.conf "${pkgdir}/etc/fonts/conf.avail/75-yes-scientifica.conf"
  install -dm755 "${pkgdir}/etc/fonts/conf.d"
  install -dm755 "${pkgdir}/usr/share/fonts"
  ln -sf -t "${pkgdir}/etc/fonts/conf.d" ../conf.avail/75-yes-scientifica.conf
}
