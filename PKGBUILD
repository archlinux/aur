# Maintainer: Moritz Lipp <mlq@pwmt.org>
# Co-Maintainer: fordprefect <fordprefect@dukun.de>
# Contributor: Thor77 <thor77@thor77.org>

pkgname=radicale
_pkgname=Radicale
pkgver=2.1.5
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

sha256sums=('d10b3b3db2113e1e1d36b6c2829b52c6aedd045e6fb00ff89c0e9218e77dce43'
            '8de8b5198f7d07d463c351fbe89aed4d0b392f97c52cf8feb04218f90918f7ac'
            '43f6f9bc1605651a6ac90ed8755f31aa7da86ac9ee06028f91359bb6e3946e60')
sha384sums=('ceed2b9af31e3ec369fe94401ff9258efc2a468cbdea4e35f5270504f1b90555f354b8841c9fc367aa3129e8eb4ba88c'
            '1bf172627cccc373f2be4a526843a1d64a8a239a3d9176bbfb02d115f3757522f27bbd672c7cfdbfa9710b199c9223a6'
            '834cbc2ef2ddd7eca187f0b6c7697d6a7595fe1e78c521051e96addbd92922700974dd221480aa757c57b2e1e587e7da')
sha512sums=('6e10bf800776ffa9f3d10f482ae9733a0bf2baa991e5878b126423ea6def9aa65f8d1f1ed9edfdb45c40687766790aadf43d1b4b54927868590dd774bc875768'
            '7dea0956c6276b6efe1bede11d337e895452cdb43c52eec88905c5c8bb1faa692f468d17d8072b29767300481ea425c5604f74ee89c5a9cb8b3b7a80adf3a1f0'
            'a6626c968b6b56cdf55de90d69e5a30b95e8833297772d2d1e091257ff86c73e8894ae3898525515610c15eea5bc3ab4305dedd3513f5afd9b3c72f5732db49c')
