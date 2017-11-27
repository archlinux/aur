# Maintainer: Moritz Lipp <mlq@pwmt.org>
# Co-Maintainer: fordprefect <fordprefect@dukun.de>
# Contributor: Thor77 <thor77@thor77.org>

pkgname=radicale
_pkgname=Radicale
pkgver=2.1.8
pkgrel=2
pkgdesc='Simple calendar (CalDAV) and contact (CardDAV) server'
arch=('any')
url='http://www.radicale.org/'
license=('GPL3')
depends=('python>=3.3' 'python-vobject' 'python-setuptools')
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

sha256sums=('fdf3942973e6778430cf1abbb8c8cb113ff104dd12b47a894642a2ebf6cf5e88'
            'bbce2d51927b3127b0dc728a7c93d4a0935155e18e225db2389d41dcaa079106'
            '43f6f9bc1605651a6ac90ed8755f31aa7da86ac9ee06028f91359bb6e3946e60')
sha384sums=('1aab6e62aa4d1212ae7e3276caf24a5bbd5c9a32934d2b96686d515d0e0c9ffec8ba3aa6d7556d0b059c03cff7d632ca'
            '92086e76a335f2ff1fd239a49a0fd80ddec472eaeba415d75adafdcffb9ab931feea2cefab9ba4efe9087a91d46abbcc'
            '834cbc2ef2ddd7eca187f0b6c7697d6a7595fe1e78c521051e96addbd92922700974dd221480aa757c57b2e1e587e7da')
sha512sums=('70d7c890a733fb27d007fa593d0140bfd3bde1ff46235252a2cdd3ceaf3bc9f998acb62e131f9bc71aa1c55f51c297e4f494cb22f8cba3c5d8d90069e4957c87'
            '2e32cbe3a2bdad754c25b250840c0bcdbf570d193c2f1d8e6a8c94ae2c5d643f9569a8571fc0054fb53574399d51483a7d761445fae7346a38a76a27b7a2f5f7'
            'a6626c968b6b56cdf55de90d69e5a30b95e8833297772d2d1e091257ff86c73e8894ae3898525515610c15eea5bc3ab4305dedd3513f5afd9b3c72f5732db49c')
