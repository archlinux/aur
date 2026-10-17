# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
_name=certipy
pkgname="python-$_name-nxc"
pkgver=5.1.0.post1
pkgrel=1
pkgdesc="Tool for Active Directory Certificate Services enumeration and abuse, netexec fork"
arch=('any')
url="https://github.com/pennyw0rth/$_name"
license=('MIT')
depends=(
  'python>=3.10'
  'python-asn1crypto>=1.5.1'
  'python-cryptography>=42.0.8'
  'python-ldap3>=2.9.1'
  'python-pyasn1>=0.6.1'
  'python-dnspython>=2.7.0'
  'python-requests>=2.32.3'
  'python-pycryptodomex>=3.22.0'
  'python-beautifulsoup4>=4.13.4'
  'python-httpx>=0.28.1'
  'python-argcomplete>=3.6.2'
  'impacket>=0.13.0'
  'python-pkg_resources'
  'python-importlib-metadata'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools>=69.0'
  'git'
)
optdepends=(
  'python-neo4j>=5.28.1: BloodHound output'
)
provides=("certipy-ad=$pkgver")
conflicts=("certipy-ad")
source=("git+$url#tag=v$pkgver")
b2sums=('28d40f06443ed01a43fe29d48012ec13557fed30a10de73e90c78ad947b0d6c2d2ad50646dfb8659b5db398d64f03412b59a9801112340b7913e332f0e6bab5c')

prepare() {
  git -C "$_name" clean -dfx
}

build() {
  cd "$_name"
  python -m build -wnx
}

package() {
  cd "$_name"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
