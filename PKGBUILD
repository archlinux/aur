# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterhub-systemdspawner
pkgdesc="Spawn JupyterHub single-user servers with systemd"
pkgver=0.15.0
pkgrel=1
url="https://github.com/jupyterhub/systemdspawner"
arch=('any')
depends=('jupyterhub')
makedepends=('python-setuptools')
license=('BSD')
source=(
  "https://files.pythonhosted.org/packages/source/j/$pkgname/$pkgname-$pkgver.tar.gz"
  'https://raw.githubusercontent.com/jupyterhub/systemdspawner/master/LICENSE'
)
sha256sums=(
  'b6e2d981657aa5d3794abb89b1650d056524158a3d0f0f706007cae9b6dbeb2b'
  '8879cac31d6a25ae880180569ea4d80ca9b24ea9e73a73b5604a9711f1744a29'
)

build() {
    cd "jupyterhub-systemdspawner-${pkgver}"
    python setup.py build
}

package() {
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "jupyterhub-systemdspawner-${pkgver}"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
    install -t "${pkgdir}/usr/share/doc/${pkgname}" -vDm 644 README.md
}

