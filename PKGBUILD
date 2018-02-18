# Maintainer: Daniel Maslowski <info at orangecms dot org>
pkgname=rkflashtool
_commit=8966c4e277de8148290554aaaa4146a3a84a3c53
pkgver=207.`echo $_commit | cut -c 1-7`
pkgrel=2
pkgdesc="Flash tool for Rockchip"
arch=('i686' 'x86_64')
url="http://linux-rockchip.info/mw/index.php?title=Rkflashtool"
license=('BSD')
depends=('libusb')
install='rkflashtool.install'
source=(
  "https://github.com/linux-rockchip/rkflashtool/archive/${_commit}.tar.gz"
  "51-rockchip.rules"
)
sha512sums=('e4604457303f5a80c93fa0043e331bb0c5f42ddec241ab69da84eb3d750482b1a21e9c32561b8a0589868ac653e8595263cf181e011a4e45b837f477169c0874'
            '4e109ffc6c48bfd8a1ec03399d41efcbf3aa1fd8efefec8ec24995c30adbc6187d419d968d9bac6f458d5d8ab0335073bab8cf8a45e1482006af0877b9176df9')

package()
{
  cd "${srcdir}/${pkgname}-${_commit}"
  make DESTDIR=${pkgdir} PREFIX=/usr install
  mkdir -p "${pkgdir}/etc/udev/rules.d/"
  head -n 26 rkflashtool.c > LICENSE
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${srcdir}"
  install -Dm 644 51-rockchip.rules "${pkgdir}/etc/udev/rules.d/51-rockchip.rules"
}
