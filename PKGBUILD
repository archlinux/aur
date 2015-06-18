# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Wes Brown <wesbrown18@gmail.com>

pkgname=volatility
pkgver=2.4.1
pkgrel=3
pkgdesc="Advanced memory forensics framework"
url="https://github.com/volatilityfoundation/volatility/wiki"
arch=('any')
license=('GPL2')
depends=('python2-crypto' 'distorm')
optdepends=(
  'yara: classify malware support'
  'python2-pillow: screenshots plugin support'
  'python2-openpyxl: excel file support'
  'python2-pytz: timezone conversion support'
  'ipython2: enhanced volshell support'
  'libforensic1394: firewire live analysis support'
  'libraw1394: alternative firewire live analysis support'
)
makedepends=('python2-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/volatilityfoundation/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('cc2db2a17b071a21852bab967c9615df0fce369dac35ffbca8754bc789e218a86fc88bd2042203174308e620e281a24debc7b0a8bacd516a404a9170ea522596')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -e 's/env python$/env python2/g' -i tools/vtype_diff.py
}

build() {
  cd ${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${pkgname}-${pkgver}

  python2 setup.py install -O1 --prefix=/usr --root="${pkgdir}"
  ln -s /usr/bin/vol.py "${pkgdir}/usr/bin/${pkgname}"

  install -d "${pkgdir}/usr/share/${pkgname}"
  mv "${pkgdir}/usr/tools" "${pkgdir}/usr/share/${pkgname}"
  mv "${pkgdir}/usr/contrib" "${pkgdir}/usr/share/${pkgname}"
  install -Dm 644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
