# Maintainer: Jeffrey Zhang <zhang.lei.fly@gmail.com>

pkgname=ansible-runner
pkgver=1.4.7
pkgrel=2
pkgdesc="A tool and python library that helps when interfacing with Ansible directly"
arch=("any")
url="https://github.com/ansible/ansible-runner"
license=('Apache')
depends=("python-psutil"
         "python-pexpect"
         "python-daemon"
         "python-yaml"
         "python-six")
makedepends=('python-setuptools')
source=("https://github.com/ansible/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2ac4c236d021503b34c3986b0bb35f75a39ac91848ab786946e136dc73b1e938')

build() {
    cd ${pkgname}-${pkgver}
    python setup.py build
}

package() {
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    cd ${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    rm -rf "${pkgdir}${site_packages}/test"
    install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
