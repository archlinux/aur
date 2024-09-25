# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=ospd-openvas
pkgver=22.7.1
pkgrel=2
pkgdesc='OSP Server for openvas'
arch=('x86_64')
url="https://github.com/greenbone/ospd-openvas"
license=('AGPL-3.0-only')
depends=('openvas-scanner' 'python-redis' 'python-psutil' 'python-packaging' 'python-lxml' 'python-defusedxml' 'python-deprecated' 'python-paho-mqtt' 'python-gnupg')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
provides=('python-ospd-openvas')
conflicts=('python-ospd-openvas')
groups=('greenbone-vulnerability-manager')
backup=("etc/gvm/ospd-openvas.conf")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/ospd-openvas/archive/v${pkgver}.tar.gz")
sha512sums=('ae7fe56a2b825efc33d9e29f2a51ab1034155ee70a5790d98f3b811a29f4b35830afabc27abd14593d74e1bcc5dac0ea1cd33ed46cc3ca459256a4b452e10552')


build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm 644 config/ospd-openvas.conf -t "${pkgdir}"/etc/gvm
    install -Dm 644 config/ospd-openvas.service -t "${pkgdir}"/usr/lib/systemd/system
}

