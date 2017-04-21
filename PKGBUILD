# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=radicale
_pkgname=Radicale
pkgver=1.1.2
pkgrel=1
pkgdesc='Simple calendar (CalDAV) and contact (CardDAV) server'
arch=('any')
url='http://www.radicale.org/'
license=('GPL3')
depends=('python>=3.2')
makedepends=('python-setuptools')
backup=('etc/radicale/config')
install='radicale.install'
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/Kozea/Radicale/archive/$pkgver.tar.gz"
	"radicale-${pkgver}.patch"
	'radicale.service'
	'radicale.install'
)
optdepends=(
	'python-passlib: bcrypt support for htpasswd access'
	'python-requests: HTTP authentication support'
	'python-dulwich: Git support'
#	'python-pam: PAM authentication support'
#	'python-ldap: LDAP authentication support'
)

prepare() {
  cd "${_pkgname}-${pkgver}"

  patch -p1 < "${srcdir}/${pkgname}-${pkgver}.patch"
}

package() {
  pushd ${_pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m644 -D 'config' "${pkgdir}/etc/radicale/config"

  install -m644 -D 'radicale.fcgi' "${pkgdir}/usr/share/${pkgname}/radicale.fcgi"
  install -m644 -D 'radicale.wsgi' "${pkgdir}/usr/share/${pkgname}/radicale.wsgi"
  popd

  install -m644 -D 'radicale.service' "${pkgdir}/usr/lib/systemd/system/radicale.service"
}

sha256sums=('8ddf030c2ca599534bb76344fa3f67b0e93f0054c0c3ed716fce304cf88403e0'
            'e9089df51c5b77741cb153cd66eb4d78ca25ff4c2bd20d638675846aa0574df3'
            '8de8b5198f7d07d463c351fbe89aed4d0b392f97c52cf8feb04218f90918f7ac'
            '24eba59e49176a731db6b227838ee0507dbc13d710f0db8685ccf55b1a14acde')
sha384sums=('0ebfefd083f063ab24d5ebb93fd62f6ed222ce6a1d9b745e908f976837e8d196eb31f82eafd1c2374ecfdb0660da2752'
            'a3aab21f82e9990b15a33d036a18318bab46c08281019c00a500c22bceb542d04d1d4f0aad0a2cb489f9c9f42525052a'
            '1bf172627cccc373f2be4a526843a1d64a8a239a3d9176bbfb02d115f3757522f27bbd672c7cfdbfa9710b199c9223a6'
            '344ee3ce9cccf504b5491846fbc1c079d32ff5c0df4b2431151a05db3b6a584267a30820174ad4d69e5e74960178c451')
sha512sums=('4c6af3f14b6d56ee55a8f649fc6c6068287974780b54b9340a1fd2f7d065c4803bd6034cfeb64d1ff2e78bb3e149b5157855afbead04d518f9600048f698dd36'
            '96d542c5f583de807602fe797d0540c4096479e5b6015da8f4b25065f6186b3287e889c6610cb32ef1b61a6daec43bb82822bc253bc0f9829e13b122cd534c0d'
            '7dea0956c6276b6efe1bede11d337e895452cdb43c52eec88905c5c8bb1faa692f468d17d8072b29767300481ea425c5604f74ee89c5a9cb8b3b7a80adf3a1f0'
            '6c1340c78c48d5574492a26e1dcd33323486fe9087dcca6db64fa2753a06db141b84d0254eaf530d52b0879380ac877a17946eee69af8844b09d22b3cab986fb')
