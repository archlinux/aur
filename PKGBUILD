# Maintainer: KiWi42 < pullthisplug dash aur at yahoo dot com >

pkgname=netexec-git
_pkgname=netexec
pkgver=v1.3.0.r4576.8d0b4e3
pkgrel=2
pkgdesc="A swiss army knife for pentesting Windows/Active Directory environments"
arch=(any)
url="https://github.com/Pennyw0rth/NetExec"
license=(BSD-2-Clause)
depends=(
    python
    impacket
    python-aardwolf
    python-anyio
    python-argcomplete
    python-asn1crypto
    python-asyauth
    python-asysocks
    python-bloodhound-ce-git
    python-certihound
    python-certipy-nxc
    python-cryptography
    python-dateutil
    python-dnspython
    python-dploot
    python-dsinternals
    python-ldap3
    python-libnmap
    python-lsassy
    python-lxml
    python-masky
    python-minikerberos
    python-msldap
    python-neo4j
    python-netifaces
    python-paramiko
    python-pefile
    python-pyasn1
    python-pyasn1-modules
    python-pycryptodomex
    python-pyjwt
    python-pylnk3
    python-pynfsclient-pennyw0rth-git
    python-pyopenssl
    python-pypsrp
    python-pypykatz
    python-requests
    python-rich
    python-six
    python-sqlalchemy
    python-termcolor
    python-terminaltables3
    python-urllib3
    python-xmltodict
)
makedepends=(python-build python-installer python-poetry-core python-poetry-dynamic-versioning git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(${pkgname%-git}::git+$url)
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "%s.r%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
