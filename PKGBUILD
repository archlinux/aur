# Maintainer: Paul Taylor <bao7uo at gmail dot com>
# Contributer: GI_Jack <GI_Jack@hackermail.com>
# Contributer: ArchStrike <team@archstrike.org>

pkgname=crackmapexec
_pkgname=CrackMapExec
pkgver=5.2.2dev
_pkgver=5.2.2
pkgrel=4
pkgdesc='A swiss army knife for pentesting Windows/Active Directory environments'
arch=('any')
url='https://github.com/byt3bl33d3r/CrackMapExec'
license=('GPL3')
depends=('impacket' 'python' 'python-aiowinreg' 'python-asn1crypto'
	 'python-asysocks' 'python-bcrypt' 'python-beautifulsoup4' 'python-bs4'
	 'python-certifi' 'python-cffi' 'python-chardet' 'python-click'
	 'python-cryptography' 'python-dnspython' 'python-flask' 'python-future'
	 'python-greenlet' 'python-idna' 'python-itsdangerous' 'python-jinja'
	 'python-ldap3' 'python-ldapdomaindump' 'python-lsassy'
	 'python-markupsafe' 'python-minidump' 'python-minikerberos'
	 'python-msgpack' 'python-msldap' 'python-netaddr' 'python-ntlm-auth'
	 'python-paramiko' 'python-prompt_toolkit' 'python-pyasn1'
	 'python-pycparser' 'python-pycryptodomex' 'python-pylnk303'
	 'python-pynacl' 'python-pyopenssl' 'python-pypsrp' 'python-pypykatz'
	 'python-pyspnego' 'python-pytz' 'python-requests-ntlm' 'python-six'
	 'python-soupsieve' 'python-termcolor' 'python-terminaltables'
	 'python-tqdm' 'python-urllib3' 'python-wcwidth' 'python-werkzeug'
	 'python-winacl' 'python-winsspi' 'python-xmltodict' 'python-zope-event'
	 'python-zope-interface' 'python-pywerview' 'python-gevent' 'python-neo4j'
	 'python-aioconsole')

#makedepends=('python-setuptools' 'python-poetry')
makedepends=('python-build' 'python-installer' 'python-poetry')
source=("${url}/archive/v${_pkgver}.tar.gz")
sha512sums=('7120f82c4a4247bcd114fa33e9b4f5ce1007a2e93180563fa95d337ce4b127d13cb9f3a2b07005d5cbbbb1cc6d3f38f3214abdccb627cf455d451122bd2f2846')

#prepare() {
#  cd $_pkgname-$_pkgver
#  make clean
#}

build() {
  cd $_pkgname-$_pkgver
  poetry build
  python -m build --wheel --no-isolation
  cd dist
  tar zxvf "${pkgname}-${_pkgver}.tar.gz"
}

package() {
  cd "${_pkgname}-${_pkgver}/"

  #python setup.py install --root="${pkgdir}" --optimize=1
  python -m installer --destdir="$pkgdir" dist/*.whl
 
  # Needed to operate:
  #install -d "${pkgdir}/usr/lib/python3.9/site-packages/cme/thirdparty/pywerview/"
  #touch "${pkgdir}/usr/lib/python3.9/site-packages/cme/thirdparty/pywerview/.default"
  # Install the license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
 
}

