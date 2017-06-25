# Maintainer: Moritz Lipp <mlq@pwmt.org>
# Co-Maintainer: fordprefect <fordprefect@dukun.de>
# Contributor: Thor77 <thor77@thor77.org>

pkgname=radicale
_pkgname=Radicale
pkgver=2.0.0
pkgrel=1
pkgdesc='Simple calendar (CalDAV) and contact (CardDAV) server'
arch=('any')
url='http://www.radicale.org/'
license=('GPL3')
depends=('python>=3.3' 'python-vobject')
makedepends=('python-setuptools')
backup=('etc/radicale/config')
install='radicale.install'
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/Kozea/Radicale/archive/$pkgver.tar.gz"
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

package() {
  pushd ${_pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m644 -D 'config' "${pkgdir}/etc/radicale/config"

  install -m644 -D 'radicale.fcgi' "${pkgdir}/usr/share/${pkgname}/radicale.fcgi"
  install -m644 -D 'radicale.wsgi' "${pkgdir}/usr/share/${pkgname}/radicale.wsgi"
  popd

  install -m644 -D 'radicale.service' "${pkgdir}/usr/lib/systemd/system/radicale.service"
}

sha256sums=('5cd66953b00ca31c74832072f7bafc1916c2d65b6ce40036b95ad4fbf92f5c55'
            '8de8b5198f7d07d463c351fbe89aed4d0b392f97c52cf8feb04218f90918f7ac'
            '43f6f9bc1605651a6ac90ed8755f31aa7da86ac9ee06028f91359bb6e3946e60')
sha384sums=('4e2311bdfa5e6fd18b742be5acb8a6f7b7d2647efad9aa7ef6c89e0d46919f3e7db1c70f2fbbbb5818eecbe5cbdacc20'
            '1bf172627cccc373f2be4a526843a1d64a8a239a3d9176bbfb02d115f3757522f27bbd672c7cfdbfa9710b199c9223a6'
            '834cbc2ef2ddd7eca187f0b6c7697d6a7595fe1e78c521051e96addbd92922700974dd221480aa757c57b2e1e587e7da')
sha512sums=('e8995bd492a3130363a736537c04e5d9be5f463cd2882e596da592de9a6ac7c4dbe89dcbc804974d974d4e606746dec9756f0137a1ef23c597c7d647d207ce89'
            '7dea0956c6276b6efe1bede11d337e895452cdb43c52eec88905c5c8bb1faa692f468d17d8072b29767300481ea425c5604f74ee89c5a9cb8b3b7a80adf3a1f0'
            'a6626c968b6b56cdf55de90d69e5a30b95e8833297772d2d1e091257ff86c73e8894ae3898525515610c15eea5bc3ab4305dedd3513f5afd9b3c72f5732db49c')
