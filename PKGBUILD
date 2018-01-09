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
            '22577c2a7b42ab2ee474e627e5603b1352c65ac8c220e470cde2638fbff9db11'
            '01c68d310fdf8c7aafd5fa8f281702938ca98833b6782396caba0b9d9c81066d')
sha384sums=('1aab6e62aa4d1212ae7e3276caf24a5bbd5c9a32934d2b96686d515d0e0c9ffec8ba3aa6d7556d0b059c03cff7d632ca'
            '5f5f46a81504ee3d8adb5bf644a41671234c5b259c169ccc4b57fe9a3a33de61c12ac5d1c1791b2a0ccbfc2b02bd5684'
            '22f6205e5f5866f5957cb877e6e332e91973bbd89e130971ce562d0586eb53508f5a416c10aa7f9d2b006287acb1054d')
sha512sums=('70d7c890a733fb27d007fa593d0140bfd3bde1ff46235252a2cdd3ceaf3bc9f998acb62e131f9bc71aa1c55f51c297e4f494cb22f8cba3c5d8d90069e4957c87'
            '380b1c98f834425d0431c9f5cd4695e0003e1c8e20ad22576fd99b261caba6e3a4c89c55d82d7f899e180316e617fbf02fa0e98826491979f01f75e78bbc2bd4'
            'd284a2eaed36a69e9d300c7905a22d32caebe7555bd389766b95d419d1454e986fccc69427033a5e9d4d479facebd03e63b6b7846ea6054c794943bf0da9d2df')
