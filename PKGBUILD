# Maintainer: Nikolas Koesling <nikolas@koesling.info>

pkgname=buildnumber-generator
pkgver=1.2.0
pkgrel=1
pkgdesc="Generate version specific build numbers from build IDs (e.g. GitLab CI_PIPELINE_IID)"
url="https://gitlab.com/NikolasK-source/buildnumber-generator"
license=('GPLv3')
arch=('any')
makedepends=('python-setuptools')
depends=('python' 'python-colorlog' 'python-cryptography' 'python-json-cmd-server')
source=("git+https://gitlab.com/NikolasK-source/buildnumber-generator.git#tag=v${pkgver}")
install=$pkgname.install

sha256sums=('SKIP')

build() {
    cd buildnumber-generator
    python setup.py build
}

package() {
    install -vDm 644 ../$pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -vDm 644 ../$pkgname-sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    cd buildnumber-generator
    install -vDm 640 cfg_systemd.toml "$pkgdir/etc/buildnumber-generator.toml"
    python setup.py install --root="$pkgdir" --optimize=1
}
